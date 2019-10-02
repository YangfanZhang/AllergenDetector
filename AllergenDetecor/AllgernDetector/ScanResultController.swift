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
        
        let allergenInfo = getAllergenInfo(data: (codeResult?.strScanned)!);
        codeTypeLabel.text = "Product Name:" + (allergenInfo[0]["description"]!);
        FullIngredientsLabel.text = "Full Ingredients:" + (allergenInfo[0]["ingredients"]!);
        codeStringLabel.text = "Your Allergens:";
        OtherAllergensLabel.text = "Other Allergens:" ;
        dump(userAllergens)
    }
    
    
    func getSwiftArrayFromPlist(name: String)->(Array<Dictionary<String,String>>)
        {
            let path = Bundle.main.path(forResource: name, ofType: "plist")
            let arr = NSArray(contentsOfFile: path!)
            return (arr as? Array<Dictionary<String,String>>)!
        }
    func getAllergenInfo(data:String)->(Array<[String:String]>)
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


