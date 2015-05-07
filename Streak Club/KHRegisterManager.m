//
//  KHRegisterManager.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/30/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHRegisterManager.h"

// Service
#import "KHRegisterService.h"

@interface KHRegisterManager()<KHRegisterServiceDelegate>

@property (nonatomic, weak) id<KHRegisterManagerDelegate>delegate;
@property (nonatomic, strong) KHRegisterService *registerService;

@end

@implementation KHRegisterManager

- (instancetype)initWithDelegate:(id<KHRegisterManagerDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
        _registerService = [[KHRegisterService alloc] initWithDelegate:self];
    }
    return self;
}

- (void)registerWithUsername:(NSString *)username password:(NSString *)password repeatPassword:(NSString *)repeatPassword email:(NSString *)email {
    [self.registerService registerWithUsername:username password:password repeatPassword:repeatPassword email:email];
}

#pragma mark - KHRegisterServiceDelegate

- (void)registerSucceededWithUsername:(NSString *)username key:(NSString *)key {
    [self.delegate registerSucceededWithUsername:username key:key];
}

- (void)registerFailedWithError:(NSError *)error {
    [self.delegate registerFailedWithError:error];
}

@end
