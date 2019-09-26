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
    @IBOutlet weak var concreteCodeImg: UIImageView!
    @IBOutlet weak var IngredientLabel: UILabel!

    var codeResult: LBXScanResult?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)

        codeTypeLabel.text = ""
        codeStringLabel.text = ""

        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        codeImg.image = codeResult?.imgScanned
        var allergenInfo = getDataForDate(data: (codeResult?.strScanned)!);
        //codeTypeLabel.text = "Barcode type:" + (codeResult?.strBarCodeType)!
        codeTypeLabel.text = allergenInfo[0]["description"];
        codeStringLabel.text = "Barcode number:" + (codeResult?.strScanned)!
        let barcode = (codeResult?.strScanned)!
        if codeImg.image != nil {
        }
        //print(getDataForDate(data: barcode))

    }
    
    func zoomRect( rect:inout CGRect, srcImg: UIImage) {
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
        
    
    func getSwiftArrayFromPlist(name: String)->(Array<Dictionary<String,String>>)
        {
            let path = Bundle.main.path(forResource: name, ofType: "plist")
            let arr = NSArray(contentsOfFile: path!)
            return (arr as? Array<Dictionary<String,String>>)!
        }
    func getDataForDate(data:String)->(Array<[String:String]>)
        {
            let array = getSwiftArrayFromPlist(name: "FoodInfo")
            let namePredicate = NSPredicate(format: "gtin_upc = %@", data)
            return [array.filter {namePredicate.evaluate(with: $0)}[0]]
        }
}

