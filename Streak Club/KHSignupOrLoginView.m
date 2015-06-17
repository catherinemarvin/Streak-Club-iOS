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

NS_ASSUME_NONNULL_BEGIN

@interface KHSignupOrLoginView()

@property (nonatomic, strong) UIView *formContainer;

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
        
        _loginForm = NO;
        
        _formContainer = ({
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = [UIColor whiteColor];
            view.layer.cornerRadius = 3.0f;
            view.layer.masksToBounds = YES;
            view;
        });
        [self addSubview:_formContainer];
        
        
        _usernameField = ({
            UITextField *field = [[UITextField alloc] init];
            field.placeholder = NSLocalizedString(@"Username", nil);
            
            field;
        });
        [self _configureTextField:_usernameField];
        [_formContainer addSubview:_usernameField];
        
        _passwordField = ({
            UITextField *field = [[UITextField alloc] init];
            field.placeholder = NSLocalizedString(@"Password", nil);
            field.secureTextEntry = YES;
            field;
        });
        [self _configureTextField:_passwordField];
        [_formContainer addSubview:_passwordField];
        
        _registerOnlyFields = [[UIView alloc] init];
        [self addSubview:_registerOnlyFields];
        
        _repeatPasswordField = ({
            UITextField *field = [[UITextField alloc] init];
            field.placeholder = NSLocalizedString(@"Repeat password", nil);
            field.secureTextEntry = YES;
            field;
        });
        [self _configureTextField:_repeatPasswordField];
        [_registerOnlyFields addSubview:_repeatPasswordField];
        
        _emailField = ({
            UITextField *field = [[UITextField alloc] init];
            field.placeholder = NSLocalizedString(@"E-mail", nil);
            field;
        });
        [self _configureTextField:_emailField];
        [_registerOnlyFields addSubview:_emailField];
        
        _actionButton = ({
            UIButton *button = [[UIButton alloc] init];
            button.titleLabel.font = [UIFont regularWithSize:16];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button;
        });
        [_formContainer addSubview:_actionButton];
        
        _switchModeButton = ({
            UIButton *button = [[UIButton alloc] init];
            button.titleLabel.font = [UIFont regularWithSize:16];
            [button setTitle:NSLocalizedString(@"Register", nil) forState:UIControlStateNormal];
            button;
        });
        [self addSubview:_switchModeButton];
        
        [self _initializeAutolayout];
        [self _setButtonTitles];
    }
    return self;
}

- (void)_initializeAutolayout {
    CGFloat sideMargin = 20.0f;
    
    [self.formContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.actionButton);
        make.left.equalTo(self).with.offset(sideMargin);
        make.right.equalTo(self).with.offset(-sideMargin);
        make.centerY.equalTo(self);
    }];
    CGFloat sidePadding = 20.0f;
    CGFloat verticalPadding = 10.0f;
    
    CGFloat fieldHeight = 44.0f;
    
    [self.usernameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.formContainer).with.offset(sidePadding);
        make.right.equalTo(self.formContainer).with.offset(-sidePadding);
        make.top.equalTo(self.formContainer).with.offset(verticalPadding);
        make.height.mas_equalTo(fieldHeight);
    }];
    
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.usernameField.mas_bottom).with.offset(verticalPadding);
        make.height.equalTo(self.usernameField);
    }];
    
    [self.registerOnlyFields mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.repeatPasswordField);
        make.bottom.equalTo(self.emailField);
    }];
    
    [self.repeatPasswordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.passwordField.mas_bottom).with.offset(verticalPadding);
        make.height.equalTo(self.usernameField);
    }];
    
    [self.emailField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.repeatPasswordField.mas_bottom).with.offset(verticalPadding);
        make.height.equalTo(self.usernameField);
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

- (void)_configureTextField:(UITextField *)textField {
    textField.font = [UIFont regularWithSize:16];
    textField.layer.borderColor = [UIColor colorWithHexString:@"cdcdcd"].CGColor;
    textField.layer.borderWidth = 2.0f;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    UIView *viewSpacer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
    textField.leftView = viewSpacer;
    textField.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setLoginForm:(BOOL)loginForm {
    if (_loginForm != loginForm) {
        _loginForm = loginForm;
        
        [self.registerOnlyFieldsHeightConstraint uninstall];
        
        if (loginForm) {
            [self.registerOnlyFields mas_updateConstraints:^(MASConstraintMaker *make) {
                self.registerOnlyFieldsHeightConstraint = make.height.mas_equalTo(0);
            }];
        }
        [self _setButtonTitles];
    }
}

- (void)_setButtonTitles {
    NSString *actionTitle;
    NSString *switchModeTitle;
    
    if (self.loginForm) {
        actionTitle = NSLocalizedString(@"Login", nil);
        switchModeTitle = NSLocalizedString(@"Go back", nil);
    } else {
        actionTitle = NSLocalizedString(@"Create Account", nil);
        switchModeTitle = NSLocalizedString(@"Already have an account?", nil);
    }
    [self.actionButton setTitle:actionTitle forState:UIControlStateNormal];
    [self.switchModeButton setTitle:switchModeTitle forState:UIControlStateNormal];
}

@end

NS_ASSUME_NONNULL_END