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

@interface KHSignupOrLoginViewModel()<KHLoginManagerDelegate, KHRegisterManagerDelegate>

@property (nonatomic, weak) id<KHSignupOrLoginViewProtocol>view;

@property (nonatomic, strong) KHLoginManager *loginManager;
@property (nonatomic, strong) KHRegisterManager *registerManager;

@end

@implementation KHSignupOrLoginViewModel

- (instancetype)initWithView:(id<KHSignupOrLoginViewProtocol>)view {
    if (self = [super init]) {
        _view = view;
        _loginManager = [[KHLoginManager alloc] initWithDelegate:self];
        _registerManager = [[KHRegisterManager alloc] initWithDelegate:self];
    }
    return self;
}

- (void)actionTapped:(NSString *)username password:(NSString *)password repeatPassword:(NSString *)repeatPassword email:(NSString *)email {
    
}

#pragma mark - KHLoginManagerDelegate

- (void)loginSucceededWithKey:(NSString *)key {
    NSLog(@"Login succeeded with key: %@", key);
}

- (void)loginFailedWithError:(NSError *)error {
    NSLog(@"Login failed with error: %@", error.debugDescription);
}

#pragma mark - KHRegisterManagerDelegate

- (void)registerSucceededWithKey:(NSString *)key {
    NSLog(@"Register succeeded with key: %@", key);
}

- (void)registerFailedWithError:(NSError *)error {
    NSLog(@"Register failed with error: %@", error.debugDescription);
}

@end
