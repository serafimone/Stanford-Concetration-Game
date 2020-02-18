//
//  SettingsViewController.swift
//  Concetration
//
//  Created by Nikita Babarykin on 18.02.2020.
//  Copyright © 2020 Nikita Babarykin. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UITableViewController {
    
    private final let cellClass = "SettingsTableViewCell"
    
    private let data: [String:UITableViewCell.AccessoryType] = ["Theme": .disclosureIndicator , "Version": .none, "About": .none]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Settings"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: cellClass)
        self.tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case self.tableView:
            return self.data.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellClass, for: indexPath) as! SettingsTableViewCell
        let tableTitle = getTableRowTitle(on: indexPath.row)
        cell.textLabel?.text = tableTitle
        cell.accessoryType = data[tableTitle] ?? .none;
        return cell;
    }
    
    private func getTableRowTitle(on indexPath: Int) -> String {
        return Array(self.data.keys)[indexPath];
    }
}
