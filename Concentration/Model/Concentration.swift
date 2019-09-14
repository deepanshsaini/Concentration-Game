//
//  Concentration.swift
//  Concentration
//
//  Created by Deepansh Saini on 15/09/19.
//  Copyright © 2019 Deepansh Saini. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard : Int?
    
    func chooseCard(at Index: Int) {
        if !cards[Index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard , matchIndex != Index {
                //chech if cards match
                if cards[matchIndex].identifier == cards[Index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[Index].isMatched = true
                }
                cards[Index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else {
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[Index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = Index
            }
        }
    }
    
    
    init(numberOfPairsOfCards : Int) {
        for identifier in 0..<numberOfPairsOfCards{
            let card = Card(identifier: identifier)
            
            //short form of below multiline comment
            cards += [card , card]
            /*
            cards.append(card)
            cards.append(card)
            */
            
            
            // TODO: Shuffle the cards
        }
    }
}
