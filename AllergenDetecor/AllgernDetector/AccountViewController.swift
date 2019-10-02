//
//  AccountViewController.swift
//  AllgernDetector
//
//  Created by Yangfan Chang on 2019/9/28.
//  Copyright © 2019 Yangfan Chang. All rights reserved.
//

import Foundation
import UIKit


public var diarySwitchState = false
public var userAllergens = [String]()

class AccountViewController: UIViewController
{
    @IBOutlet weak var DiaryLabel: UILabel!
    @IBOutlet weak var DiarySwitch: UISwitch!
    @IBAction func DiarySwitchEvent(_ sender: UISwitch) {
        updateDiarySwitchState()
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        updateDiarySwitchState()
    }
    
    
    func updateDiarySwitchState()
    {
        if DiarySwitch.isOn
        {
            diarySwitchState = true
            for item in AllergenSynonyms.milkSynonyms{
                userAllergens.addObjectIfNew(item)
            }
            print("pizza")
        }
        else
        {
            diarySwitchState = false
            for item in AllergenSynonyms.milkSynonyms{
                userAllergens.removeIfObjectExist(item)
            }
            print("milk")
        }
    }
}

extension Array where Element: Equatable {
    mutating func addObjectIfNew(_ item: Element) {
        if !contains(item) {
            append(item)
        }
    }
}
extension Array where Element: Equatable {
    // Remove first collection element that is equal to the given `object`:
    mutating func removeIfObjectExist(_ item: Element) {
        guard let index = firstIndex(of: item) else {return}
        remove(at: index)
    }
}
