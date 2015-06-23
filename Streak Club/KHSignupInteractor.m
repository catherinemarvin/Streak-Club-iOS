//
//  KHSignupInteractor.m
//  Streak Club
//
//  Created by Kevin Hwang on 6/18/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSignupInteractor.h"

// Wireframe
#import "KHGlobalTabBarWireframe.h"

// Data Source
#import "KHRegisterManager.h"

// Session Management
#import "KHSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHSignupInteractor()<KHRegisterManagerDelegate>

@property (nonatomic, strong) KHRegisterManager *registerManager;

@end

@implementation KHSignupInteractor

- (void)actionTapped:(nullable NSString *)username password:(nullable NSString *)password repeatPassword:(nullable NSString *)repeatPassword email:(nullable NSString *)email {
    
}

#pragma mark - Lazy Instantiation

- (KHRegisterManager *)registerManager {
    if (!_registerManager) {
        _registerManager = [[KHRegisterManager alloc] initWithDelegate:self];
    }
    return _registerManager;
}


#pragma mark - KHRegisterManagerDelegate

- (void)registerSucceededWithUsername:(NSString *)username key:(NSString *)key {
    [[KHSessionManager sharedInstance] loginWithUsername:username key:key];
    KHGlobalTabBarWireframe *wire = [[KHGlobalTabBarWireframe alloc] init];
    [wire presentMainView];
}

- (void)registerFailedWithError:(NSError *)error {
    
}

@end

NS_ASSUME_NONNULL_END