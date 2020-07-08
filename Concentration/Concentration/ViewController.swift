//
//  ViewController.swift
//  Memorygame
//
//  Created by Adam on 07/07/2020.
//  Copyright © 2020 Adam, Krystian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 { didSet { flipCountLabel.text = "Flip Count: \(flipCount)" } }
    var scoreCount = 0 { didSet { scoreCountLabel.text = "Score: \(scoreCount)"} }
    
    @IBOutlet weak var scoreCountLabel: UILabel!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount = game.flipCount
        scoreCount = game.score
        if let cardNumber = cardButtons.index(of: sender){
            if !game.cards[cardNumber].isMatched { flipCount += 1 }
            
            game.chooseCard(at: cardNumber)
           updateViewFromModel()
        }else {
            print("card is not in cardButton array")
        }
    }
    
   var timer : Timer?
    @IBOutlet weak var timerLabel: UILabel!
    var milliseconds: Float = 30 * 1000 // 30 sec
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
                timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .commonModes )   }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    //Mark : Timer Mathods
    @objc func timerElapsed(){
        
        milliseconds -= 1
        
       let seconds = String(format:"%.2f", milliseconds/1000)
      
        timerLabel.text = "time Remaining: \(seconds)"
        
        if milliseconds <= 0 {
            
            timer?.invalidate()
            timerLabel.textColor = UIColor.red
            updateViewFromModel()
           
        }
    }
    
    
       @IBAction func touchNewGame(_ sender: UIButton) {
        // reset game
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        // reset theme choices
        emojiChoices = theme.getRandomThemeIcons()
        // update view
        scoreCount = game.score
        flipCount = game.flipCount
        updateViewFromModel()
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
        let theme = Theme()
    
       lazy var emojiChoices = theme.getRandomThemeIcons()

    var emoji = [Int: String]()

    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}


