//
//  kimara.swift
//  Battleknight
//
//  Created by Eric Cuevas on 5/16/16.
//  Copyright © 2016 mackenstein. All rights reserved.
//

import Foundation

class kimara: enemy {
    
    let immune_max = 15
    
    override var loot: [String]{
        return ["Tough Hide", "Kimara Venom", "Rare Trident"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= immune_max {
            return super.attemptAttack(attackPwr)
        
        } else {
            return false
        }
    }
}