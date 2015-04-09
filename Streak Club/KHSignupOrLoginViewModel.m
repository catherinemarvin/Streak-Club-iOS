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

@interface KHSignupOrLoginViewModel()<KHLoginManagerDelegate>

@property (nonatomic, weak) id<KHSignupOrLoginViewProtocol>view;

@property (nonatomic, strong) KHLoginManager *loginManager;

@end

@implementation KHSignupOrLoginViewModel

- (instancetype)initWithView:(id<KHSignupOrLoginViewProtocol>)view {
    if (self = [super init]) {
        _view = view;
        _loginManager = [[KHLoginManager alloc] initWithDelegate:self];
    }
    return self;
}

- (void)actionTapped:(NSString *)username password:(NSString *)password repeatPassword:(NSString *)repeatPassword email:(NSString *)email {
    
}

#pragma mark - KHLoginManagerDelegate

@end
