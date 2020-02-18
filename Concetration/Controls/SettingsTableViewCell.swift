//
//  TableViewCell.swift
//  Concetration
//
//  Created by Nikita Babarykin on 19.02.2020.
//  Copyright © 2020 Nikita Babarykin. All rights reserved.
//

import Foundation
import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
}
