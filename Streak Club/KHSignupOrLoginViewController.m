//
//  KHSignupOrLoginViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/28/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSignupOrLoginViewController.h"

// Views
#import "KHSignupOrLoginView.h"

// View Helpers
#import <Masonry.h>

// Login
#import "KHLoginManager.h"

@interface KHSignupOrLoginViewController ()<KHLoginManagerDelegate>

@property (nonatomic, strong) KHSignupOrLoginView *signupLoginView;

@property (nonatomic, strong) KHLoginManager *loginManager;

@end

@implementation KHSignupOrLoginViewController

- (instancetype)init {
    if (self = [super init]) {
        _loginManager = [[KHLoginManager alloc] initWithDelegate:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.signupLoginView = [[KHSignupOrLoginView alloc] init];
    [self.view addSubview:self.signupLoginView];
    
    [self.signupLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.signupLoginView.loginButton addTarget:self action:@selector(_loginTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.signupLoginView.registerButton addTarget:self action:@selector(_registerTapped:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Button Presses

- (void)_loginTapped:(id)sender {
    NSString *username = self.signupLoginView.usernameField.text;
    NSString *password = self.signupLoginView.passwordField.text;
    [self.loginManager loginWithUsername:username password:password];
}

- (void)_registerTapped:(id)sender {
    
}

@end
