//
//  DevilWizard.swift
//  Battleknight
//
//  Created by Eric Cuevas on 5/16/16.
//  Copyright © 2016 mackenstein. All rights reserved.
//

import Foundation

class DevilWizard: enemy {
    
    override var loot: [String]{
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
    
}