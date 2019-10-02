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
    
    @IBOutlet weak var PeanutLabel: UILabel!
    @IBOutlet weak var PeanutSwitch: UISwitch!
    @IBAction func PeanutSwitchEvent(_ sender: UISwitch) {
    }
    
    @IBOutlet weak var TreeNutLabel: UILabel!
    @IBOutlet weak var TreeNutSwitch: UISwitch!
    @IBAction func TreeNutsSwitchEvent(_ sender: UISwitch) {
    }
    
    
    @IBOutlet weak var EggsLabel: UILabel!
    @IBOutlet weak var EggsSwitch: UISwitch!
    @IBAction func EggsSwitchEvent(_ sender: UISwitch) {
    }
    
    
    @IBOutlet weak var SesameLabel: UILabel!
    @IBOutlet weak var SesameSwitch: UISwitch!
    @IBAction func SesameSwitchEvent(_ sender: UISwitch) {
    }
    
    @IBOutlet weak var FishLabel: UILabel!
    @IBOutlet weak var FishSwitch: UISwitch!
    @IBAction func FishSwitchEvent(_ sender: UISwitch) {
    }
    
    
    @IBOutlet weak var ShellfishLabel: UILabel!
    @IBOutlet weak var ShellfishSwitch: UISwitch!
    @IBAction func ShellfishSwitchEvent(_ sender: UISwitch) {
    }
    
    @IBOutlet weak var SoyLabel: UILabel!
    @IBOutlet weak var SoySwitch: UISwitch!
    @IBAction func SoySwitchEvent(_ sender: UISwitch) {
    }
    
    
    @IBOutlet weak var WheatLabel: UILabel!
    @IBOutlet weak var WheatSwitch: UISwitch!
    @IBAction func WheatSwitchEvent(_ sender: UISwitch) {
    }
    
    
    @IBOutlet weak var LupinLabel: UILabel!
    @IBOutlet weak var LupinSwitch: UISwitch!
    @IBAction func LupinSwitchEvent(_ sender: UISwitch) {
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
