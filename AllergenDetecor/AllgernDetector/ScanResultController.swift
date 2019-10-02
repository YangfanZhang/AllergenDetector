//
//  ScanResultController.swift
//  swiftScan
//
//  Created by xialibing on 15/12/11.
//  Copyright © 2015年 xialibing. All rights reserved.
//

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
        //OtherAllergensLabel.text = ""
        FullIngredientsLabel.text = ""
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        codeImg.image = codeResult?.imgScanned
        if codeImg.image != nil {
        }
        
        let productInfo = getProductInfo(data: (codeResult?.strScanned)!);
        let productIngredient = productInfo[0]["ingredients"]!
        let productName = productInfo[0]["description"]!
        let userAllergensInProduct = getUserAllergensInProduct(ingredients: productIngredient, allergens: userAllergens)
        let allAllergensInProduct = getAllAllergensInProduct(ingredients: productIngredient, allAllergens: AllergenSynonyms.allAllergensSynonyms)
        codeTypeLabel.text = "Product Name:" + (productName);
        FullIngredientsLabel.text = "Full Ingredients:" + (productIngredient);
        
        codeStringLabel.text = "Your Allergens:" + (userAllergensInProduct);
        OtherAllergensLabel.text = "Other Allergens:" + (allAllergensInProduct);
        dump(userAllergens)
    }
    
    func getAllAllergensInProduct(ingredients: String, allAllergens: Array<String> )-> (String)
    {
        var result = [String]()
        for item in allAllergens
        {
            if(ingredients.containsIgnoringCase(find: item))
            {
                result.addObjectIfNew(item)
            }
        }
        return result.joined(separator: ",")
    }
    
    
    func getUserAllergensInProduct(ingredients: String, allergens: Array<String> )->(String)
    {
        var result = [String]()
        for item in allergens
        {
            if(ingredients.containsIgnoringCase(find: item))
          {
            result.addObjectIfNew(item)
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
    func getProductInfo(data:String)->(Array<[String:String]>)
        {
            let array = getSwiftArrayFromPlist(name: "Sheet1")
            let namePredicate = NSPredicate(format: "gtin_upc = %@", data)
            return [array.filter {namePredicate.evaluate(with: $0)}[0]]
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

