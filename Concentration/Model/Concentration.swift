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
    private(set) var cards = [Card]()
    
    //creating a computed property
    private var indexOfOneAndOnlyFaceUpCard : Int? {
        get {
            var foundIndex : Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                    return nil
                    }
                }
            } 
            return foundIndex
        }
        set{
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        //asserts are added to crash program in development phases and should be ignored while uploading to app store
        assert(cards.indices.contains(index),"Concentration.chooseCard(at: \(index)):chosen index not in cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard , matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    
    init(numberOfPairsOfCards : Int) {
        assert(numberOfPairsOfCards > 0 , "Concentration.init(at: \(numberOfPairsOfCards)):you must have atleast one number of pair of cards")
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card , card]
            
            // TODO: Shuffle the cards
            
            
        }
    }
}
