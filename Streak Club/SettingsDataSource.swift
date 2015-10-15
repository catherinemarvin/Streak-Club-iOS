//
//  SettingsDataSource.swift
//  Streak Club
//
//  Created by Kevin Hwang on 10/14/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

import UIKit

enum SettingsCellType : Int {
    case Logout = 1
    case Username
    case Contact
    case COUNT
}

private let settingsCellIdentifier = "settingsCellIdentifier"

final class SettingsDataSource: NSObject, UITableViewDataSource {
    @objc func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    @objc func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsCellType.COUNT.rawValue
    }
    
    @objc func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(settingsCellIdentifier, forIndexPath: indexPath)
        
        if let settingsViewCell = cell as? SettingsViewCell {
            _configureCell(settingsViewCell, indexPath: indexPath)
        }
        return cell;
    }
    
    private func _configureCell(cell:SettingsViewCell, indexPath:NSIndexPath) {
        if let cellType = SettingsCellType(rawValue: indexPath.row) {
            let title = _titleForCellType(cellType)
            cell.textLabel?.text = title
        }
    }
    
    private func _titleForCellType(cellType:SettingsCellType) -> String {
        let title:String
        
        switch cellType {
        case .Logout:
            title = NSLocalizedString("Logout", comment: "Settings cell: logout button.")
        case .Username:
            title = NSLocalizedString("Username", comment: "Settings cell: displays the username")
        case .Contact:
            title = NSLocalizedString("Contact", comment: "Settings cell: displays a button that the user can tap to contact the admins.")
        case .COUNT:
            assert(false, "Should not be getting title for count enum")
            title = "Unknown"
        }
        return title
    }
}