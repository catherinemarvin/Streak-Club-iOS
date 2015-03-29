//
//  KHSignupOrLoginView.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/28/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSignupOrLoginView.h"

// View Helpers
#import <Masonry/Masonry.h>
#import "UIFont+CustomFonts.h"
#import "UIColor+HexString.h"

@interface KHSignupOrLoginView()

@property (nonatomic, strong) UITextField *usernameField;
@property (nonatomic, strong) UITextField *passwordField;

@property (nonatomic, strong) UIView *registerOnlyFields;
@property (nonatomic, strong) UITextField *repeatPasswordField;
@property (nonatomic, strong) UITextField *emailField;

@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registerButton;

@end

@implementation KHSignupOrLoginView

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"34a0f2"];
        
        _usernameField = ({
            UITextField *field = [[UITextField alloc] init];
            
            field;
        });
        [self addSubview:_usernameField];
        
        _passwordField = ({
            UITextField *field = [[UITextField alloc] init];
            field;
        });
        [self addSubview:_passwordField];
        
        _registerOnlyFields = [[UIView alloc] init];
        [self addSubview:_registerOnlyFields];
        
        _repeatPasswordField = ({
            UITextField *field = [[UITextField alloc] init];
            field;
        });
        [_registerOnlyFields addSubview:_repeatPasswordField];
        
        _emailField = ({
            UITextField *field = [[UITextField alloc] init];
            field;
        });
        [_registerOnlyFields addSubview:_emailField];
        
        _loginButton = ({
            UIButton *button = [[UIButton alloc] init];
            button;
        });
        [self addSubview:_loginButton];
        
        _registerButton = ({
            UIButton *button = [[UIButton alloc] init];
            button;
        });
        [self addSubview:_registerButton];
    }
    return self;
}

@end
