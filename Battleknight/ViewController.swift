//
//  ViewController.swift
//  Battleknight
//
//  Created by Eric Cuevas on 5/16/16.
//  Copyright © 2016 mackenstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var printLbl: UILabel!

    @IBOutlet weak var playerHPLbl: UILabel!
    
    @IBOutlet weak var enemyHPLbl: UILabel!

    @IBOutlet weak var enemyImage: UIImageView!

    @IBOutlet weak var chestbutton: UIButton!
    
    var Player: player!
    
    var Enemy: enemy!
    
    var chestMessage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Player = player(name: "robotron4968", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        playerHPLbl.text = "\(Player.hp) HP"
        
    }
    
    func generateRandomEnemy() {
            let rand = Int(arc4random_uniform(2))
            
            if rand == 0 {
                Enemy = kimara(startingHP: 50, attackPwr: 12)
            } else {
                Enemy = DevilWizard(startingHP: 60, attackPwr: 15)
            }
        
            enemyImage.hidden = false
     }
        // Do any additional setup after loading the view, typically from a nib.
    

    
    @IBAction func chestTapped(sender: AnyObject) {
        chestbutton.hidden = true
        printLbl.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
        
    }
    
    @IBAction func attackTapped(sender: AnyObject) {
        
        if Enemy.attemptAttack(Player.attackPwr) {
            printLbl.text = "Attacked \(Enemy.type) for \(Player.attackPwr) HP"
            enemyHPLbl.text = "\(Enemy.hp) HP"
            
        } else {
            printLbl.text = "Attack was unsuccessful!"
        }
        
        if let loot = Enemy.dropLoot() {
            Player.addItemToInventory(loot)
            chestMessage = "\(Player.name) found \(loot)"
            chestbutton.hidden = false
        }
        
        if !Enemy.isAlive {
            enemyHPLbl.text = ""
            printLbl.text = "Killed \(Enemy.type)"
            enemyImage.hidden = true
        }
    }
    
}

