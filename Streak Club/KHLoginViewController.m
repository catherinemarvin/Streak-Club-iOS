//
//  KHLoginViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 6/18/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHLoginViewController.h"

// View
#import "KHLoginView.h"

// Interactor
#import "KHLoginInteractor.h"

// View Helper
#import <Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHLoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) KHLoginView *loginView;

@end

@implementation KHLoginViewController

@synthesize splashScreenVC = _splashScreenVC;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.loginView];
    
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.loginView.usernameField.delegate = self;
    self.loginView.passwordField.delegate = self;
    
    [self.loginView.actionButton addTarget:self action:@selector(_actionTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.switchModeButton addTarget:self action:@selector(_switchModeTapped) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Lazy Instantiation

- (KHLoginView *)loginView {
    if (!_loginView) {
        _loginView = [[KHLoginView alloc] init];
    }
    return _loginView;
}

#pragma mark - Button Presses
- (void)_actionTapped {
    
}

- (void)_switchModeTapped {
    
}

#pragma mark - UITextFieldDelegate 

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    BOOL shouldReturn = NO;
    if ([textField isEqual:self.loginView.usernameField]) {
        [self.loginView.passwordField becomeFirstResponder];
    } else if ([textField isEqual:self.loginView.passwordField]) {
        shouldReturn = YES;
        [self _actionTapped];
    }
    return shouldReturn;
}

@end

NS_ASSUME_NONNULL_END
