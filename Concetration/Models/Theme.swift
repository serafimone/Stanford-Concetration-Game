//
//  Theme.swift
//  Concetration
//
//  Created by Nikita Babarykin on 09.02.2020.
//  Copyright © 2020 Nikita Babarykin. All rights reserved.
//

import Foundation
import UIKit

public enum Themes: CaseIterable {
    case sport
    case halloween
    case animals
    
    var colors: Theme {
        switch self {
        case .sport:
            return Theme(backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cardColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), emojiChoices: "⚽️🏀🏈⚾️🥎🎾🏐🏉")
        case .halloween:
            return Theme(backgroundColor: #colorLiteral(red: 0.1607643962, green: 0.1607944667, blue: 0.1607603133, alpha: 1), cardColor: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), emojiChoices: "🤡👻💀🧟‍♀️🤖☠️😼😈")
        case .animals:
            return Theme(backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cardColor: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), emojiChoices: "🦉🐸🦁🐥🦆🐙🐍🐺")
        }
    }
}

public struct Theme {
    
    private(set) var backgroundColor: UIColor
    
    private(set) var cardColor: UIColor
    
    private(set) var emojiChoices: String
    
    init(backgroundColor: UIColor, cardColor: UIColor, emojiChoices: String) {
        self.backgroundColor = backgroundColor
        self.cardColor = cardColor
        self.emojiChoices = emojiChoices
    }
    
}
