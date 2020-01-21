//
//  ViewController.swift
//  Concetration
//
//  Created by Nikita Babarykin on 21.01.2020.
//  Copyright © 2020 Nikita Babarykin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var game = Concetration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    private var flipsCounter = 0 {
        didSet {
            flipsCountLabel.text = "Flips: \(flipsCounter)"
        }
    }
    
    private var numberOfPairsOfCards: Int {
        get {
            return (cardsButtons.count + 1) / 2
        }
    }
    
    @IBOutlet private weak var flipsCountLabel: UILabel!
    
    @IBOutlet private var cardsButtons: [UIButton]!
    
    private var emojiChoices = ["🤡", "👻", "💀", "🧟‍♀️", "🤖", "☠️", "😼", "😈"]
    
    private var emoji = [Int:String]()
    
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardsButtons.firstIndex(of: sender) {
            self.flipsCounter += 1
            print("Flipping card with index \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel() {
        for index in cardsButtons.indices {
            let button = cardsButtons[index]
            let card = game.getCard(at: index)
            if card.isFaceUp {
                let title = emoji(for: card)
                button.setTitle(title, for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                button.isEnabled = !card.isMatched
            }
        }
    }
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}

