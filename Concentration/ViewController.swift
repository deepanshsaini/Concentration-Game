//
//  ViewController.swift
//  Concentration
//
//  Created by Deepansh Saini on 13/09/19.
//  Copyright © 2019 Deepansh Saini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0{
        didSet{
            flipContLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var emojiChoices = ["😃","😇","😃","😇" ]
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipContLabel: UILabel! 
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            print("cardNumber = \(cardNumber)")
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }else{
            print("chosen card was not in cardButtons")
        }
        
        
    }
    
    
    func flipCard(withEmoji emoji:String, on button:UIButton){
        print("flipCard(withEmoji: \(emoji)")
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5482786298, blue: 0.2414379716, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }


}

