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
public var peanutSwitchState = false
public var treeNutSwitchState = false
public var eggsSwitchState = false
public var sesameSwitchState = false
public var fishSwitchState = false
public var shellfishSwitchState = false
public var soySwitchState = false
public var wheatSwitchState = false
public var lupinSwitchState = false
public var userAllergens = [String]()

class AccountViewController: UIViewController
{
    @IBOutlet weak var DiaryLabel: UILabel!
    @IBOutlet weak var DiarySwitch: UISwitch!
    @IBAction func DiarySwitchEvent(_ sender: UISwitch) {
        updateSwitchState(allergenSwitch: DiarySwitch, switchState: &diarySwitchState, allergenSynonyms: AllergenSynonyms.milkSynonyms)
    }
    
    @IBOutlet weak var PeanutLabel: UILabel!
    @IBOutlet weak var PeanutSwitch: UISwitch!
    @IBAction func PeanutSwitchEvent(_ sender: UISwitch) {
        updateSwitchState(allergenSwitch: PeanutSwitch, switchState: &peanutSwitchState, allergenSynonyms: AllergenSynonyms.peanutSynonyms)
    }
    
    @IBOutlet weak var TreeNutLabel: UILabel!
    @IBOutlet weak var TreeNutSwitch: UISwitch!
    @IBAction func TreeNutsSwitchEvent(_ sender: UISwitch) {
        updateSwitchState(allergenSwitch: TreeNutSwitch, switchState: &treeNutSwitchState, allergenSynonyms: AllergenSynonyms.treeNutSynonyms)
    }
    
    
    @IBOutlet weak var EggsLabel: UILabel!
    @IBOutlet weak var EggsSwitch: UISwitch!
    @IBAction func EggsSwitchEvent(_ sender: UISwitch) {
        updateSwitchState(allergenSwitch: EggsSwitch, switchState: &eggsSwitchState, allergenSynonyms: AllergenSynonyms.eggSynonyms)
    }
    
    
    @IBOutlet weak var SesameLabel: UILabel!
    @IBOutlet weak var SesameSwitch: UISwitch!
    @IBAction func SesameSwitchEvent(_ sender: UISwitch) {
        updateSwitchState(allergenSwitch: SesameSwitch, switchState: &sesameSwitchState, allergenSynonyms: AllergenSynonyms.sesameSynonyms)
    }
    
    @IBOutlet weak var FishLabel: UILabel!
    @IBOutlet weak var FishSwitch: UISwitch!
    @IBAction func FishSwitchEvent(_ sender: UISwitch) {
        updateSwitchState(allergenSwitch: FishSwitch, switchState: &fishSwitchState, allergenSynonyms: AllergenSynonyms.fishSynonyms)
    }
    
    
    @IBOutlet weak var ShellfishLabel: UILabel!
    @IBOutlet weak var ShellfishSwitch: UISwitch!
    @IBAction func ShellfishSwitchEvent(_ sender: UISwitch) {
        updateSwitchState(allergenSwitch: ShellfishSwitch, switchState: &shellfishSwitchState, allergenSynonyms: AllergenSynonyms.crustacea​Synonyms)
    }
    
    @IBOutlet weak var SoyLabel: UILabel!
    @IBOutlet weak var SoySwitch: UISwitch!
    @IBAction func SoySwitchEvent(_ sender: UISwitch) {
        updateSwitchState(allergenSwitch: SoySwitch, switchState: &soySwitchState, allergenSynonyms: AllergenSynonyms.soySynonyms)
    }
    
    
    @IBOutlet weak var WheatLabel: UILabel!
    @IBOutlet weak var WheatSwitch: UISwitch!
    @IBAction func WheatSwitchEvent(_ sender: UISwitch) {
        updateSwitchState(allergenSwitch: WheatSwitch, switchState: &wheatSwitchState, allergenSynonyms: AllergenSynonyms.wheatSynonyms)
    }
    
    
    @IBOutlet weak var LupinLabel: UILabel!
    @IBOutlet weak var LupinSwitch: UISwitch!
    @IBAction func LupinSwitchEvent(_ sender: UISwitch) {
        updateSwitchState(allergenSwitch: LupinSwitch, switchState: &lupinSwitchState, allergenSynonyms: AllergenSynonyms.lupinSynonyms)
    }
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        updateSwitchState(allergenSwitch: DiarySwitch, switchState: &diarySwitchState, allergenSynonyms: AllergenSynonyms.milkSynonyms)
        updateSwitchState(allergenSwitch: PeanutSwitch, switchState: &peanutSwitchState, allergenSynonyms: AllergenSynonyms.peanutSynonyms)
        updateSwitchState(allergenSwitch: TreeNutSwitch, switchState: &treeNutSwitchState, allergenSynonyms: AllergenSynonyms.treeNutSynonyms)
        updateSwitchState(allergenSwitch: EggsSwitch, switchState: &eggsSwitchState, allergenSynonyms: AllergenSynonyms.eggSynonyms)
        updateSwitchState(allergenSwitch: SesameSwitch, switchState: &sesameSwitchState, allergenSynonyms: AllergenSynonyms.sesameSynonyms)
        updateSwitchState(allergenSwitch: FishSwitch, switchState: &fishSwitchState, allergenSynonyms: AllergenSynonyms.fishSynonyms)
        updateSwitchState(allergenSwitch: ShellfishSwitch, switchState: &shellfishSwitchState, allergenSynonyms: AllergenSynonyms.crustacea​Synonyms)
        updateSwitchState(allergenSwitch: SoySwitch, switchState: &soySwitchState, allergenSynonyms: AllergenSynonyms.soySynonyms)
        updateSwitchState(allergenSwitch: WheatSwitch, switchState: &wheatSwitchState, allergenSynonyms: AllergenSynonyms.wheatSynonyms)
        updateSwitchState(allergenSwitch: LupinSwitch, switchState: &lupinSwitchState, allergenSynonyms: AllergenSynonyms.lupinSynonyms)
    }
        
    
    func updateSwitchState(allergenSwitch : UISwitch, switchState: inout Bool, allergenSynonyms : Array<String>)
    {
        if allergenSwitch.isOn
        {
            switchState = true
            for item in allergenSynonyms{
                userAllergens.addObjectIfNew(item)
            }
        }
        else
        {
            switchState = false
            for item in allergenSynonyms{
                userAllergens.removeIfObjectExist(item)
            }
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
