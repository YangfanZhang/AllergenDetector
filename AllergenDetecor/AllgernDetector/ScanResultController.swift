import UIKit

class ScanResultController: UIViewController {

    @IBOutlet weak var codeImg: UIImageView!
    @IBOutlet weak var codeTypeLabel: UILabel!
    @IBOutlet weak var codeStringLabel: UILabel!
    @IBOutlet weak var OtherAllergensLabel: UILabel!
    @IBOutlet weak var FullIngredientsLabel: UILabel!
    @IBOutlet weak var concreteCodeImg: UIImageView!
    var codeResult: LBXScanResult?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)

        codeTypeLabel.text = ""
        codeStringLabel.text = ""
        OtherAllergensLabel.text = ""
        FullIngredientsLabel.text = ""
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        codeImg.image = codeResult?.imgScanned
        if codeImg.image != nil {
        }
        let start = DispatchTime.now()
        let productInfo = getProductInfo(data: (codeResult?.strScanned)!);
        let productIngredient = productInfo["ingredients"]!
        let productName = productInfo["description"]!
        let productIngredientArray = productIngredient.components(separatedBy: ",")
        let userAllergensInProduct = getUserAllergensInProduct(ingredientArray: productIngredientArray, allAllergens: userAllergens)
        let allAllergensInProduct = getAllAllergensInProduct(ingredientArray: productIngredientArray, allAllergens: AllergenSynonyms.allAllergensSynonyms)
        let otherAllergens = getOtherAllergensInProduct(allAllgergens: allAllergensInProduct, userAllergensInProduct: userAllergensInProduct)
        codeTypeLabel.text = "Product Name:" + (productName);
        FullIngredientsLabel.text = "Full Ingredients:" + (productIngredient);
        
        codeStringLabel.text = "Your Allergens:" + (userAllergensInProduct);
        OtherAllergensLabel.text = "Other Allergens:" + (otherAllergens);
        let end = DispatchTime.now()
        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
        let timeInterval = Double(nanoTime) / 1_000_000_000
        dump("Time to retreieve info: \(timeInterval) seconds")
        print("---")
    }
    
    func getOtherAllergensInProduct(allAllgergens: String, userAllergensInProduct: String) -> (String)
    {
        let arrayUser = userAllergensInProduct.components(separatedBy: ",")
        var arrayAll = allAllgergens.components(separatedBy: ",")
        
        for item in arrayUser
        {
            if(allAllgergens.containsIgnoringCase(find: item))
            {
                arrayAll.removeIfObjectExist(item)
            }
        }
        return arrayAll.joined(separator: ",")
    }
    
    func getAllAllergensInProduct(ingredientArray: Array<String>, allAllergens: Array<String> )-> (String)
    {
        var result = [String]()
        for item in allAllergens
        {
            for ingredient in ingredientArray
            {
                if(ingredient.containsIgnoringCase(find: item))
                {
                    result.addObjectIfNew(ingredient)
                }
            }

        }
        return result.joined(separator: ",")
    }
        
    func getUserAllergensInProduct(ingredientArray: Array<String>, allAllergens: Array<String> )->(String)
    {
        var result = [String]()
        for item in allAllergens
        {
            for ingredient in ingredientArray
            {
                  if(ingredient.containsIgnoringCase(find: item))
                {
                  result.addObjectIfNew(ingredient)
                }
            }
        }
        return result.joined(separator: ",")
    }
    
    func getSwiftArrayFromPlist(name: String)->(Array<Dictionary<String,String>>)
        {
            let path = Bundle.main.path(forResource: name, ofType: "plist")
            let arr = NSArray(contentsOfFile: path!)
            return (arr as? Array<Dictionary<String,String>>)!
        }
    
    func getProductInfo(data:String)->([String:String])
        {
            let array = getSwiftArrayFromPlist(name: "Combined_food_info_utf8")
            return binarySearch(array, key: data) { $0["gtin_upc"]! }!
        }
    
//    func getProductInfo(data:String)->([String:String])
//        {
//            let array = getSwiftArrayFromPlist(name: "Combined_food_info_utf8")
//            let idArray = array.map { (dictionary) -> String in
//                dictionary["gtin_upc"]!
//            }
//            if let index = binarySearch(idArray, key: data) {
//                return array[index]
//            }
//            else
//            {
//                return ["":""]
//            }
//        }

//    func getProductInfo(data:String)->(Array<[String:String]>)
//        {
//            let array = getSwiftArrayFromPlist(name: "Combined_food_info_utf8")
//            let namePredicate = NSPredicate(format: "gtin_upc = %@", data)
//            return [array.filter {namePredicate.evaluate(with: $0)}[0]]
//        }
        
//     func binarySearch<T: Comparable>(_ a: [T], key: T) -> Int? {
//        var lowerBound = 0
//        var upperBound = a.count
//        while lowerBound < upperBound {
//            let midIndex = lowerBound + (upperBound - lowerBound) / 2
//            if a[midIndex] == key {
//                return midIndex
//            } else if a[midIndex] < key {
//                lowerBound = midIndex + 1
//            } else {
//                upperBound = midIndex
//            }
//        }
//        return nil
//    }
    
    func binarySearch<T: Comparable, U>(_ a: [U], key: T, keyMapper: (U) -> T) -> U? {
        var lowerBound = 0
        var upperBound = a.count
        while lowerBound < upperBound {
            let midIndex = lowerBound + (upperBound - lowerBound) / 2
            if keyMapper(a[midIndex]) == key {
                return a[midIndex]
            } else if keyMapper(a[midIndex]) < key {
                lowerBound = midIndex + 1
            } else {
                upperBound = midIndex
            }
        }
        return nil
    }
    
    
    
    func zoomRect( rect:inout CGRect, srcImg: UIImage)
    {
        rect.origin.x -= 10
        rect.origin.y -= 10
        rect.size.width += 20
        rect.size.height += 20

        if rect.origin.x < 0 {
            rect.origin.x = 0
        }

        if (rect.origin.y < 0) {
            rect.origin.y = 0
        }

        if (rect.origin.x + rect.size.width) > srcImg.size.width {
            rect.size.width = srcImg.size.width - rect.origin.x - 1
        }

        if (rect.origin.y + rect.size.height) > srcImg.size.height {
            rect.size.height = srcImg.size.height - rect.origin.y - 1
        }
    }
}

extension String {
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
}
