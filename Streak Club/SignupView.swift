//
//  SignupView.swift
//  Streak Club
//
//  Created by Kevin Hwang on 10/16/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

import UIKit
import SnapKit

final class SignupView: UIView {
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
        return field;
    }()
    
    let passwordField: UITextField = {
       let field = UITextField()
        field.placeholder = NSLocalizedString("Password", comment: "Input form for a password")
        field.secureTextEntry = true
        return field
    }()
    
    let repeatPasswordField: UITextField = {
        let field = UITextField()
        field.placeholder = NSLocalizedString("Repeat password", comment: "Input form to confirm password")
        field.secureTextEntry = true
        return field;
    }()
    
    let emailField: UITextField = {
        let field = UITextField()
        field.placeholder = NSLocalizedString("Email", comment: "Input form for a user's email")
        return field
    }()
    
    let actionButton: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("Create Account", comment: "Button for creating an account"), forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        return button
    }()
    
    let switchModeButton: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("Already have an account?", comment: "Button for switching between registering and logging in."), forState: UIControlState.Normal)
        return button
    }()
    
    
    
    init() {
        super.init(frame: CGRectZero)
        _configureSubviews()
        _initializeAutolayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _configureSubviews() {
        addSubview(formContainer)
        formContainer.addSubview(usernameField)
        formContainer.addSubview(passwordField)
        formContainer.addSubview(repeatPasswordField)
        formContainer.addSubview(emailField)
        formContainer.addSubview(actionButton)
        addSubview(switchModeButton)
    }
    
    private func _initializeAutolayout() {
        let sideMargin: Float = 20
        formContainer.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(actionButton)
            make.left.equalTo(self).offset(sideMargin)
            make.right.equalTo(self).offset(-sideMargin)
            make.centerY.equalTo(self)
        }
        
        let sidePadding: Float = 20
        let verticalPadding: Float = 10
        let fieldHeight: Float = 44
        
        usernameField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(formContainer).offset(sidePadding)
            make.right.equalTo(formContainer).offset(-sidePadding)
            make.top.equalTo(formContainer).offset(verticalPadding)
            make.height.equalTo(fieldHeight)
        }
    }
    
}