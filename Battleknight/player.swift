//
//  player.swift
//  Battleknight
//
//  Created by Eric Cuevas on 5/16/16.
//  Copyright © 2016 mackenstein. All rights reserved.
//

import Foundation

class player: character {
    private var _name = "player"
    
    var name : String {
        get {
            return _name
        }
    }
    private var _inventory = [String]()
    
    var inventory: [String] {
        return _inventory
    }
    
    func addItemToInventory(item: String) {
        _inventory.append(item)
    }
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHP: hp, attackPwr: attackPwr)
        
        _name = name
    }
}