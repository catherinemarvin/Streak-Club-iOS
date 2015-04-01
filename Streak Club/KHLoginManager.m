//
//  KHLoginManager.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/30/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHLoginManager.h"

// Service
#import "KHLoginService.h"

@interface KHLoginManager()<KHLoginServiceDelegate>

@property (nonatomic, weak) id<KHLoginManagerDelegate>delegate;
@property (nonatomic, strong) KHLoginService *loginService;

@end

@implementation KHLoginManager

- (instancetype)initWithDelegate:(id<KHLoginManagerDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
        _loginService = [[KHLoginService alloc] initWithDelegate:self];
    }
    return self;
}

- (void)loginWithUsername:(NSString *)username password:(NSString *)password {
    [self.loginService loginWithUsername:username password:password];
}

#pragma mark - KHLoginServiceDelegate

- (void)loginSucceededWithKey:(NSString *)key {
    NSLog(@"Login succeeded with key: %@", key);
}

- (void)loginFailedWithError:(NSString *)error {
    NSLog(@"Login failed: %@", error);
}

@end
