//
//  AllergenSynonyms.swift
//  AllgernDetector
//
//  Created by Yangfan Chang on 2019/9/29.
//  Copyright © 2019 Yangfan Chang. All rights reserved.
//

import Foundation

public struct AllergenSynonyms
{
    static let milkSynonyms = [String](arrayLiteral: "Milk", "Lactose", "Diary", "Butter", "Casein", "Caseinates",
                                       "Cheese", "Cottage", "Cream", "Curds", "Custard", "Ghee", "Hydrolysed whey",
                                       "Ice cream", "Lactalbumin", "Lactoacidophilus", "Lactoglobulin", "Lactoferrin",
                                       "Lactulose", "Marscarpone", "Nisin", "Quarg", "QuarkM", "Whey", "Whitener", "Yoghurt")
    
    static let peanutSynonyms = [String](arrayLiteral: "Peanut", "Arachis", "Beer nut", "Earth nut",
                                         "Goober nut", "Groundnut", "Madelonas", "Mixed nut", "Monkey nut",
                                         "Nu-nut", "Nut pieces", "Nutmeat", "Satay" )
    
    static let treeNutSynonyms = [String](arrayLiteral: "Almonds", "Almond meal","Almond paste","Artificial nuts","Beer nuts",
                                        "Brazil nuts","Caponata","Cashews","Gianduja","Hazelnuts", "Filberts","Hickory nuts","Indian nuts" ,"Cashews","Macadamia nuts","Macaroons","Marzipan","Natural nut","Non-gai nuts", "nan-gai nuts","Nut flavoured alcoholic liqueurs and syrups","Nut meat", "nut meal","Nut milks","Nut oils",
                                            "Nut paste", "butter or spreads","Pecans", "mashuga nuts","Pine nuts","Pistachios","Pralines","Walnuts")
    
    static let eggSynonyms = [String](arrayLiteral: "Albumen", "albumin","Apovitellin","Avidin","Egg", "yolk","Egg noodles",
                                      "Egg substitutes","Flavoproteins","French toast","Frittatas","Fritters","Globulin",
                                      "Imitation egg product","Livetin","Lysozyme","Macaroons","Meringue", "Meringue mix",
                                       "Omelette","soufflé","Ovalbumin","Ovomucin","Ovomucoid","Ovovitellin","Pavlova",
                                        "Quiche", "Silica albuminate", "Vitellin")
    
    static let sesameSynonyms = [String](arrayLiteral: "Aqua Libra", "Benne", "Benniseed", "Gingelly seeds","Gomasio", "gomashio",
                                         "Halva", "halva", "Hummus", "Pasteli", "Sesame","Sesame seed","Sesamol", "Sesomolina",
                                         "Sim sim","Tahini","tahina","Til")

    static let fishSynonyms = [String](arrayLiteral: "Anchovy","Barramundi","Bass","Bluefish","Bream","Carp","Catfish","Caviar",
                                       "Char","Chub","Cod","Eel","Flake","Flounder","Grouper","Gurnard","Haddock","Hake",
                                       "Halibut","Herring","Imitation crab","Mackerel","Mahi-mahi","Marlin","Monkfish",
                                       "Orange Roughy","Perch","Pickerel","Pike","Plaice","Pollock","Pompano","Rockfish","Salmon",
                                       "Sardines","Sashimi","Shark","Smelt","Snapper","Surimi","Tilapia","Trout","Tuna","White Fish",
                                       "Whiting","Whitebait")
    
    static let crustacea​Synonyms = [String](arrayLiteral: "Shellfish", "Balmain bugs", "Crab","Crayfish", "Lobster",
                                        "Moreton Bay Bugs","Marron","Shrimp","crevette", "Prawns", "Yabbies", "Molluscs",
                                        "Abalone (paua)","Barnacles","Clams", "Cockles","Cuttlefish","Kina","Limpets",
                                        "Mussels","Octopus","Oysters","Periwinkles","Pipi","Scallops","Sea snails",
                                        "Squid", "Calamari","Tuatua","Toheroa")
    
    static let soySynonyms = [String](arrayLiteral: "Bean curd","Black bean sauce","Edamame","Hydrolysed plant protein",
                                      "Hydrolysed soy protein","Hydrolysed vegetable protein","Kinako","Miso","Natto",
                                      "Okara","Soja","Soy", "soya","Soy bean", "soya bean","Soy bean oil", "soya oil",
                                      "Soy bean paste","Soy bean sprouts","Soy cheeses","Soy flour","Soy ice cream",
                                      "Soy milk","Soy protein isolate", "Soy sauce","Soy yoghurt","Tamari","Tempeh",
                                      "Teriyaki","Textured vegetable protein","Tofu")
    
    static let lupinSynonyms = [String](arrayLiteral: "Lupin","Lupini","Lupine","Lupin kernel", "Lupin beans",
                                        "Lupin bran", "Lupin fibre","Lupin flour","Lupinus","White lupin", "Lupinus albus",
                                        "Yellow lupin", "Lupinus luteus","Narrow-leafed sweet lupin","Pear lupin", "tarwin lupin")
    
    static let wheatSynonyms = [String](arrayLiteral: "Bran","Breadcrumbs","Bulgar","bulgur","burghul","Couscous",
                                        "Cracker meal","Farina","Flour","Gluten","Graham flour","Kamut","Matzoh",
                                        "Risone","Rusk","Seitan","Semolina","Spelt", "dinkel","Tabouleh","Triticale",
                                        "Wheat","Whole wheat berries")

    
}
