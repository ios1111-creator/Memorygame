//
//  ViewController.swift
//  Memorygame
//
//  Created by Adam on 06/07/2020.
//  Copyright © 2020 Adam, Krystian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func touchCard(_ sender: UIButton) {
        if cardButtons.index(of: sender) != nil{
           flipCard(with: "👻", on: sender)
        }else {
            print("card is not in cardButton array")
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    static var count = 0
    
    func flipCard(with emoji:String, on button: UIButton){
        ViewController.count += 1
        flipCountLabel.text = "Flip Count: \(ViewController.count)"
        if button.currentTitle != emoji {
            button.backgroundColor =  colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button.setTitle(emoji, for: UIControl.State.normal)
        }else {
            button.backgroundColor =  colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            button.setTitle("", for: UIControl.State.normal)
        }
        
    }
    
   
    
}
