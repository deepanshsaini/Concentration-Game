//
//  Card.swift
//  Concentration
//
//  Created by Deepansh Saini on 15/09/19.
//  Copyright © 2019 Deepansh Saini. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier : Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(identifier : Int) {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
