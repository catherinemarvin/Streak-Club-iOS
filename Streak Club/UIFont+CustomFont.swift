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

public extension UIFont {
    class func regularWithSize(size: Float) -> UIFont {
        let convertedSize = CGFloat(size)
        return UIFont(name: regularFont, size: convertedSize)!
    }
    
    class func boldWithSize(size: Float) -> UIFont {
        let convertedSize = CGFloat(size)
        return UIFont(name: boldFont, size: convertedSize)!
    }
}