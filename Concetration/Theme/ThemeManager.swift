//
//  ThemeManager.swift
//  Concetration
//
//  Created by Nikita Babarykin on 10.02.2020.
//  Copyright © 2020 Nikita Babarykin. All rights reserved.
//

import Foundation
import UIKit

class ThemeManager {
    
    static weak var window: UIWindow?
    
    static private(set) var currentTheme: Themes? {
        didSet{
            guard currentTheme != oldValue else {return}
            apply()
        }
    }
    
    static func setTheme(to theme: Themes) {
        self.currentTheme = theme
    }
    
    static private func apply() {
        setColors()
        if let window = window {
            window.subviews.forEach({ (view: UIView) in
                view.removeFromSuperview()
                window.addSubview(view)
            })
        }
    }
    
    static func getEmojis() -> String {
        return currentTheme?.colors.emojiChoices ?? ""
    }
    
    static private func setColors() {
        CardButton.appearance().backgroundColor = currentTheme?.colors.cardColor
        AppView.appearance().backgroundColor = currentTheme?.colors.backgroundColor
        UICounterLabel.appearance().textColor = currentTheme?.colors.cardColor
        UITableView.appearance().backgroundColor = currentTheme?.colors.backgroundColor
        UITableViewCell.appearance().backgroundColor = currentTheme?.colors.backgroundColor
        UINavigationBar.appearance().barTintColor = currentTheme?.colors.backgroundColor
        UINavigationBar.appearance().backgroundColor = currentTheme?.colors.backgroundColor
        UINavigationBar.appearance().tintColor = currentTheme?.colors.cardColor
    }

}
