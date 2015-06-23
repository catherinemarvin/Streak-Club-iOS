//
//  KHLoginInteractor.m
//  Streak Club
//
//  Created by Kevin Hwang on 6/22/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHLoginInteractor.h"

// Wireframe
#import "KHGlobalTabBarWireframe.h"

// Data Source
#import "KHLoginManager.h"

// Session Management
#import "KHSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHLoginInteractor ()<KHLoginManagerDelegate>

@property (nonatomic, strong) KHLoginManager *loginManager;

@end

@implementation KHLoginInteractor

- (void)actionTapped:(nullable NSString *)username password:(nullable NSString *)password {
    
}

#pragma mark - Lazy Instanitation

- (KHLoginManager *)loginManager {
    if (!_loginManager) {
        _loginManager = [[KHLoginManager alloc] initWithDelegate:self];
    }
    return _loginManager;
}

#pragma mark - KHLoginManagerDelegate

- (void)loginSucceededWithUsername:(NSString *)username key:(NSString *)key {
    [[KHSessionManager sharedInstance] loginWithUsername:username key:key];
    KHGlobalTabBarWireframe *wire = [[KHGlobalTabBarWireframe alloc] init];
    [wire presentMainView];
}

- (void)loginFailedWithError:(NSError *)error {
    
}

@end

NS_ASSUME_NONNULL_END