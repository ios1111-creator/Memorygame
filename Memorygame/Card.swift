//
//  Card.swift
//  Memorygame
//
//  Created by Adam on 06/07/2020.
//  Copyright © 2020 Adam, Krystian. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifer() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifer()
    }
}
