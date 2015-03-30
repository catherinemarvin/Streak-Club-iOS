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
        
        [self _initializeAutolayout];
    }
    return self;
}

- (void)_initializeAutolayout {
    CGFloat sideMargin = 20.0f;
    
    [self.usernameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(sideMargin);
        make.right.equalTo(self).with.offset(-sideMargin);
        make.top.equalTo(self);
    }];
    
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.usernameField.mas_bottom);
    }];
    
    [self.registerOnlyFields mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.repeatPasswordField);
        make.bottom.equalTo(self.emailField);
    }];
    
    [self.repeatPasswordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.passwordField.mas_bottom);
    }];
    
    [self.emailField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.repeatPasswordField.mas_bottom);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.emailField.mas_bottom);
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.loginButton.mas_bottom);
    }];
}

@end
