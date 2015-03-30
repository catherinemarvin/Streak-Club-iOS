//
//  KHSessionManager.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/29/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSessionManager.h"

@interface KHSessionManager()

@property (nonatomic, strong) NSString *key;

@end

@implementation KHSessionManager

+ (KHSessionManager *)sharedInstance {
    static KHSessionManager *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (void)loginWithUsername:(NSString *)username key:(NSString *)key {
    
}

- (void)logout {
    
}


@end
