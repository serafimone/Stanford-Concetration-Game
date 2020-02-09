//
//  MoreViewController.swift
//  Concetration
//
//  Created by Nikita Babarykin on 09.02.2020.
//  Copyright © 2020 Nikita Babarykin. All rights reserved.
//

import Foundation
import UIKit

class MoreViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        
        return stackView;
    }()
    
    private lazy var themeButtons: [UIButton] = {
        var buttons = [UIThemeButton]()
        
        for theme in Themes.allCases {
            let themeButton = UIThemeButton()
            themeButton.backgroundColor = theme.colors.cardColor
            themeButton.setTitle(String(theme.colors.emojiChoices.randomElement()!) , for: .normal)
            themeButton.set(theme: theme)
            themeButton.addTarget(self, action: #selector(changeTheme), for: .touchUpInside)
            buttons.append(themeButton)
        }
        
        return buttons
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stackView.translatesAutoresizingMaskIntoConstraints = false

        themeButtons.forEach {stackView.addArrangedSubview($0)}
        
        self.view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    
    @objc func changeTheme(_ sender: UIThemeButton) {
        ThemeManager.setTheme(to: sender.theme!)
    }
    
}
