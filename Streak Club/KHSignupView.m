//
//  KHSignupView.m
//  Streak Club
//
//  Created by Kevin Hwang on 6/18/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSignupView.h"

#import "UIFont+CustomFonts.h"
#import "UIColor+HexString.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHSignupView()

@property (nonatomic, strong) UIView *formContainer;

@property (nonatomic, strong) UITextField *usernameField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UITextField *repeatPasswordField;
@property (nonatomic, strong) UITextField *emailField;

@property (nonatomic, strong) UIButton *actionButton;

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
    


@end

NS_ASSUME_NONNULL_END
