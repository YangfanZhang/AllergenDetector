//
//  AccountViewController.swift
//  AllgernDetector
//
//  Created by Yangfan Chang on 2019/9/28.
//  Copyright © 2019 Yangfan Chang. All rights reserved.
//

import Foundation
import UIKit


class AccountViewController: UIViewController
{
    public var userAllergen = [String]()
    @IBAction func DiaryToggle(_ sender: UISwitch) {
        if (sender.isOn == true)
        {
            self.userAllergen.append("diary")
            //userAllergen.append("lactose")
            //userAllergen.append("milk")
        }
    }
    override func viewDidLoad(){
        super.viewDidLoad()
    }
}
