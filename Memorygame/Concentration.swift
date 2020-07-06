//
//  Concentration.swift
//  Memorygame
//
//  Created by Adam on 06/07/2020.
//  Copyright © 2020 Adam, Krystian. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUp: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUp, matchIndex != index {
                // 2 cards are face up, check if cards match
                if cards[index].identifier == cards[matchIndex].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUp = nil
            } else {
                // one card is selected, turn down other cards and set this card
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUp = index
            }
        }
    }
    
    init(numberOfPairsOfCard: Int){
        for _ in 0..<numberOfPairsOfCard {
            let card = Card()
            cards += [card, card]
        }
    }
    
    //TODO shuffle cards
}
