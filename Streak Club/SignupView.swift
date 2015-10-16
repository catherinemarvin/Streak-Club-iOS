//
//  SignupView.swift
//  Streak Club
//
//  Created by Kevin Hwang on 10/16/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

import UIKit

final class SignupView: UIView {
    let formContainer: UIView = {
        let view = UITextField()
        view.backgroundColor = UIColor.whiteColor()
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        return view
    }()
    
    init() {
        super.init(frame: CGRectZero)
        _configureSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _configureSubviews() {
        addSubview(formContainer)
    }
    
}