//
//  LoginView.swift
//  Streak Club
//
//  Created by Kevin Hwang on 10/27/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

import Foundation

class LoginView: UIView {
    private let formContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.whiteColor()
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        
        return view
    }()
    
    let usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = NSLocalizedString("Username", comment: "Input form for a username")
        _configureTextField(field)
        
       return field
    }()
    
    let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = NSLocalizedString("Password", comment: "Input form for a password")
        field.secureTextEntry = true
        _configureTextField(field)
        return field
    }()
    
    let actionButton: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("Login", comment: "Button for logging into an account"), forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
       return button
    }()
    
    let switchModeButton: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("Don't have an account?", comment: "Button from moving from the login view to the register view"), forState: UIControlState.Normal)
        return button
    }()
}

private func _configureTextField(field: UITextField) {
    field.font = UIFont.regularWithSize(16)
    field.layer.borderColor = UIColor(hexString: "cdcdcd").CGColor
    field.layer.borderWidth = 2
    field.autocapitalizationType = UITextAutocapitalizationType.None
    field.autocorrectionType = UITextAutocorrectionType.No
    
    let viewSpacer = UIView(frame: CGRectMake(0, 0, 10, 0))
    field.leftView = viewSpacer
    field.leftViewMode = UITextFieldViewMode.Always
}