//
//  SettingsViewCell.swift
//  Streak Club
//
//  Created by Kevin Hwang on 10/13/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

import UIKit

class SettingsViewCell: UITableViewCell {

    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textLabel?.font = UIFont.regularWithSize(18)
    }
}
