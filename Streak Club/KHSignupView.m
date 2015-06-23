//
//  KHSignupView.m
//  Streak Club
//
//  Created by Kevin Hwang on 6/18/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSignupView.h"

// View Helper
#import "UIFont+CustomFonts.h"
#import "UIColor+HexString.h"
#import <Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHSignupView()

@property (nonatomic, strong) UIView *formContainer;

@property (nonatomic, strong) UITextField *usernameField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UITextField *repeatPasswordField;
@property (nonatomic, strong) UITextField *emailField;

@property (nonatomic, strong) UIButton *actionButton;
@property (nonatomic, strong) UIButton *switchModeButton;

@end

@implementation KHSignupView

- (instancetype)init {
    if (self = [super init]) {
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
            field.placeholder = NSLocalizedString(@"Username", @"Input form for a username");
            field;
        });
        [_formContainer addSubview:_usernameField];
        [self _configureTextField:_usernameField];
        
        _passwordField = ({
            UITextField *field = [[UITextField alloc] init];
            field.placeholder = NSLocalizedString(@"Password", @"Input form for a password");
            field.secureTextEntry = YES;
            field;
        });
        [_formContainer addSubview:_passwordField];
        
        _repeatPasswordField = ({
            UITextField *field = [[UITextField alloc] init];
            field.placeholder = NSLocalizedString(@"Repeat password", @"Input form to confirm password");
            field.secureTextEntry = YES;
            field;
        });
        [_formContainer addSubview:_repeatPasswordField];
        
        _actionButton = ({
            UIButton *button = [[UIButton alloc] init];
            [button setTitle:NSLocalizedString(@"Create Account", @"Button for creating an account") forState:UIControlStateNormal];
            button;
        });
        [_formContainer addSubview:_actionButton];
        
        _switchModeButton = ({
            UIButton *button = [[UIButton alloc] init];
            [button setTitle:NSLocalizedString(@"Already have an account?", @"Button for moving from the register view to the login view") forState:UIControlStateNormal];
            button;
        });
        [self addSubview:_switchModeButton];
        [self _initializeAutolayout];
    }
    return self;
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
    


@end

NS_ASSUME_NONNULL_END
