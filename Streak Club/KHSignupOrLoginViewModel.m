//
//  KHSignuporLoginViewModel.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/2/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSignupOrLoginViewModel.h"

// Login
#import "KHLoginManager.h"

// Register
#import "KHRegisterManager.h"

// Session Management
#import "KHSessionManager.h"

// Wireframe
#import "KHGlobalTabBarWireframe.h"

@interface KHSignupOrLoginViewModel()<KHLoginManagerDelegate, KHRegisterManagerDelegate>

@property (nonatomic, weak) id<KHSignupOrLoginViewProtocol>view;

@property (nonatomic, strong) KHLoginManager *loginManager;
@property (nonatomic, strong) KHRegisterManager *registerManager;

@property (nonatomic, assign) BOOL loginMode;

@end

@implementation KHSignupOrLoginViewModel

- (instancetype)initWithView:(id<KHSignupOrLoginViewProtocol>)view {
    if (self = [super init]) {
        _view = view;
        _loginManager = [[KHLoginManager alloc] initWithDelegate:self];
        _registerManager = [[KHRegisterManager alloc] initWithDelegate:self];
        _loginMode = YES;
    }
    return self;
}

- (void)actionTapped:(NSString *)username password:(NSString *)password repeatPassword:(NSString *)repeatPassword email:(NSString *)email {
    if (self.loginMode) {
        [self.loginManager loginWithUsername:username password:password];
    } else {
        [self.registerManager registerWithUsername:username password:password repeatPassword:repeatPassword email:email];
    }
}

- (void)toggleModeTapped {
    self.loginMode = !self.loginMode;
    [self.view setLoginMode:self.loginMode];
}

#pragma mark - KHLoginManagerDelegate

- (void)loginSucceededWithUsername:(NSString *)username key:(NSString *)key {
    [[KHSessionManager sharedInstance] loginWithUsername:username key:key];
    KHGlobalTabBarWireframe *wire = [[KHGlobalTabBarWireframe alloc] init];
    [wire presentMainView];
}

- (void)loginFailedWithError:(NSError *)error {
    NSLog(@"Login failed with error: %@", error.debugDescription);
}

#pragma mark - KHRegisterManagerDelegate

- (void)registerSucceededWithUsername:(NSString *)username key:(NSString *)key {
    [[KHSessionManager sharedInstance] loginWithUsername:username key:key];
    KHGlobalTabBarWireframe *wire = [[KHGlobalTabBarWireframe alloc] init];
    [wire presentMainView];
}

- (void)registerFailedWithError:(NSError *)error {
    NSLog(@"Register failed with error: %@", error.debugDescription);
}

@end
