//
//  Card.swift
//  Concentration
//
//  Created by Deepansh Saini on 15/09/19.
//  Copyright © 2019 Deepansh Saini. All rights reserved.
//

import Foundation

struct Card : Hashable
{
    var hashable : Int { return identifier }
    
    static func ==(lhs: Card , rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier : Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
