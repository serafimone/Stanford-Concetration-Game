//
//  UIThemeButton.swift
//  Concetration
//
//  Created by Nikita Babarykin on 10.02.2020.
//  Copyright © 2020 Nikita Babarykin. All rights reserved.
//

import Foundation
import UIKit

class UIThemeButton: UIButton {
    
    private(set) var theme: Themes?
    
    func set(theme: Themes) {
        self.theme = theme
    }
    
}
