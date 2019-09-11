//
//  ViewController.swift
//  AllergenDetecor
//
//  Created by Yangfan Chang on 2019/9/11.
//  Copyright © 2019 Yangfan Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(getDataForDate(data: "356425"))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    func getSwiftArrayFromPlist(name: String)->(Array<Dictionary<String,String>>)
    {
        let path = Bundle.main.path(forResource: name, ofType: "plist")
        let arr = NSArray(contentsOfFile: path!)
        return (arr as? Array<Dictionary<String,String>>)!
    }
    func getDataForDate(data:String)->(Array<[String:String]>)
    {
        let array = getSwiftArrayFromPlist(name: "Sheet1")
        let namePredicate = NSPredicate(format: "fdc_id = %@", data)
        return [array.filter {namePredicate.evaluate(with: $0)}[0]]        
    }
}

