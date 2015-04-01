//
//  KHSignupOrLoginView.h
//  Streak Club
//
//  Created by Kevin Hwang on 3/28/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KHSignupOrLoginView : UIView

@property (nonatomic, strong, readonly) UITextField *usernameField;
@property (nonatomic, strong, readonly) UITextField *passwordField;

@property (nonatomic, strong, readonly) UITextField *repeatPasswordField;
@property (nonatomic, strong, readonly) UITextField *emailField;

@property (nonatomic, strong, readonly) UIButton *loginButton;
@property (nonatomic, strong, readonly) UIButton *registerButton;

@end
