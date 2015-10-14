//
//  UIFont+CustomFont.swift
//  Streak Club
//
//  Created by Kevin Hwang on 10/13/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

import UIKit

private let regularFont = "Dosis-Regular"
private let boldFont = "Dosis-Bold"

extension UIFont {
    func regularWithSize(size: CGFloat) -> UIFont {
       return UIFont(name: regularFont, size: size)!
    }
    
    func boldWithSize(size: CGFloat) -> UIFont {
       return UIFont(name: boldFont, size: size)!
    }
}