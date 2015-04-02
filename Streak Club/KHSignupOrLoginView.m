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
@property (nonatomic, strong) MASConstraint *registerOnlyFieldsHeightConstraint;


@property (nonatomic, strong) UITextField *repeatPasswordField;
@property (nonatomic, strong) UITextField *emailField;

@property (nonatomic, strong) UIButton *actionButton;
@property (nonatomic, strong) UIButton *switchModeButton;

@end

@implementation KHSignupOrLoginView

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"34a0f2"];
        
        _loginForm = YES;
        
        _usernameField = ({
            UITextField *field = [[UITextField alloc] init];
            field.font = [UIFont regularWithSize:16];
            field.placeholder = NSLocalizedString(@"Username", nil);
            
            field;
        });
        [self addSubview:_usernameField];
        
        _passwordField = ({
            UITextField *field = [[UITextField alloc] init];
            field.font = [UIFont regularWithSize:16];
            field.placeholder = NSLocalizedString(@"Password", nil);
            field;
        });
        [self addSubview:_passwordField];
        
        _registerOnlyFields = [[UIView alloc] init];
        [self addSubview:_registerOnlyFields];
        
        _repeatPasswordField = ({
            UITextField *field = [[UITextField alloc] init];
            field.font = [UIFont regularWithSize:16];
            field.placeholder = NSLocalizedString(@"Repeat password", nil);
            field;
        });
        [_registerOnlyFields addSubview:_repeatPasswordField];
        
        _emailField = ({
            UITextField *field = [[UITextField alloc] init];
            field.font = [UIFont regularWithSize:16];
            field.placeholder = NSLocalizedString(@"E-mail", nil);
            field;
        });
        [_registerOnlyFields addSubview:_emailField];
        
        _actionButton = ({
            UIButton *button = [[UIButton alloc] init];
            button.titleLabel.font = [UIFont regularWithSize:16];
            [button setTitle:NSLocalizedString(@"Login", nil) forState:UIControlStateNormal];
            button;
        });
        [self addSubview:_actionButton];
        
        _switchModeButton = ({
            UIButton *button = [[UIButton alloc] init];
            button.titleLabel.font = [UIFont regularWithSize:16];
            [button setTitle:NSLocalizedString(@"Register", nil) forState:UIControlStateNormal];
            button;
        });
        [self addSubview:_switchModeButton];
        
        [self _initializeAutolayout];
    }
    return self;
}

- (void)_initializeAutolayout {
    CGFloat sideMargin = 20.0f;
    
    [self.usernameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(sideMargin);
        make.right.equalTo(self).with.offset(-sideMargin);
        make.centerY.equalTo(self);
    }];
    
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.usernameField.mas_bottom);
    }];
    
    [self.registerOnlyFields mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.repeatPasswordField);
        make.bottom.equalTo(self.emailField);
        self.registerOnlyFieldsHeightConstraint = make.height.mas_equalTo(0);
    }];
    
    [self.repeatPasswordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.passwordField.mas_bottom);
    }];
    
    [self.emailField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.repeatPasswordField.mas_bottom);
    }];
    
    [self.actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.emailField.mas_bottom);
    }];
    
    [self.switchModeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.actionButton.mas_bottom);
    }];
}

- (void)setLoginForm:(BOOL)loginForm {
    if (_loginForm != loginForm) {
        _loginForm = loginForm;
        
        [self.registerOnlyFieldsHeightConstraint uninstall];
        
        if (loginForm) {
            [self.registerOnlyFields mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(0);
            }];
        }
    }
}

@end
