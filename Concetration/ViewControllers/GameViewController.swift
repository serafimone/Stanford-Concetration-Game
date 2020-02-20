//
//  ViewController.swift
//  Concetration
//
//  Created by Nikita Babarykin on 21.01.2020.
//  Copyright © 2020 Nikita Babarykin. All rights reserved.
//

import UIKit
import Foundation

class GameViewController: UIViewController {

    private lazy var game = Concetration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    private var flipsCounter = 0 {
        didSet{
            updateFlipCountLabel()
        }
    }
    
    private var numberOfPairsOfCards: Int {
        get {
            return (cardsButtons.count + 1) / 2
        }
    }
    
    @IBOutlet private weak var flipsCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet private var cardsButtons: [UIButton]!
    
    private var emojiChoices = ""
    
    private var emoji = [Card:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newGameButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-restart-50"), style: .plain, target: self, action: #selector(self.startNewGame))
        self.navigationItem.setLeftBarButton(newGameButton, animated: true)
        
        let settingsButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-settings-50"), style: .plain, target: self, action: #selector(self.goToSettings))
        self.navigationItem.setRightBarButton(settingsButton, animated: true)
        
        emojiChoices = ThemeManager.getEmojis()
    }
    
    @objc private func goToSettings(_ sender: UIBarButtonItem?) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @objc private func startNewGame(_ sender: UIBarButtonItem?) {
        game = Concetration(numberOfPairsOfCards: numberOfPairsOfCards)
        flipsCounter = 0
        emojiChoices = ThemeManager.getEmojis()
        updateViewFromModel()
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardsButtons.firstIndex(of: sender) {
            self.flipsCounter += 1
            print("Flipping card with index \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key:Any] = [
            .foregroundColor: UIColor.orange
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipsCounter)", attributes: attributes)
        flipsCountLabel.attributedText = attributedString
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
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : ThemeManager.currentTheme?.colors.cardColor
                button.isEnabled = !card.isMatched
            }
        }
    }
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        
        return emoji[card] ?? "?"
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

