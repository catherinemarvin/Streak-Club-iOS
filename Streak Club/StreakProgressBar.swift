//
//  StreakProgressBar.swift
//  Streak Club
//
//  Created by Kevin Hwang on 10/14/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

import UIKit

final class StreakProgressBar : UIView {
    init() {
        super.init(frame: CGRectZero)
        self.backgroundColor = UIColor.blackColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var filledInView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.redColor()
        
        return view
    }()
    
}
