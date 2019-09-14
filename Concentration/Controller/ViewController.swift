//
//  ViewController.swift
//  Concentration
//
//  Created by Deepansh Saini on 13/09/19.
//  Copyright © 2019 Deepansh Saini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (self.cardButtons.count + 1)/2)
    
    var flipCount = 0{
        didSet{
            flipContLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipContLabel: UILabel! 
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("chosen card was not in cardButtons")
        }
        
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5482786298, blue: 0.2414379716, alpha: 0) :  #colorLiteral(red: 1, green: 0.5482786298, blue: 0.2414379716, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["😃","😇","😂","😝","😁","😱","👉","🙌","🍻","🔥","🌈","☀","🎈","🌹","💄","🎀","⚽","🎾","🏁","😡","👿","🐻"]
    
    var emoji = [Int:String]()
    
    func emoji(for card:Card) -> String{
        if emoji[card.identifier] ==  nil, emojiChoices.count > 0
        {
            let randomIndex = Int(arc4random_uniform(UInt32(emoji.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        // short form of below code is exactly the executable return statement
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        } else {
//            return "?"
//        }
        
        return emoji[card.identifier] ?? "?"
        
    }
    


}

