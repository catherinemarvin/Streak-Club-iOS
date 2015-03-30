//
//  KHSessionManager.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/29/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSessionManager.h"

// Keychain
#import <SSKeychain/SSKeychain.h>

@interface KHSessionManager()

@property (nonatomic, strong) NSString *key;

@end

static NSString *const KhkKeychainServiceKey = @"com.khwang.StreakClub";
static NSString *const KhkUsernameKey = @"KhkUsernameKey";

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
    self.key = key;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:username forKey:KhkUsernameKey];
    [userDefaults synchronize];
    
    NSError *error;
    if ([SSKeychain setPassword:key forService:KhkKeychainServiceKey account:username error:&error]) {
        NSLog(@"Key saved!");
    } else {
        NSLog(@"Failed to save key: %@", error.debugDescription);
    }
}

- (void)logout {
    NSError *error;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *username = [userDefaults objectForKey:KhkUsernameKey];
    
    if (![SSKeychain deletePasswordForService:KhkKeychainServiceKey account:username error:&error] && error) {
        NSLog(@"Failed to logout: %@", error.localizedDescription);
    }
    self.key = nil;
    
    [userDefaults removeObjectForKey:KhkUsernameKey];
    [userDefaults synchronize];
}


@end
