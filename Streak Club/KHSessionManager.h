//
//  KHSessionManager.h
//  Streak Club
//
//  Created by Kevin Hwang on 3/29/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KHSessionManager : NSObject

@property (nonatomic, strong, readonly) NSString *key;

+ (KHSessionManager *)sharedInstance;

/**
 @brief Logs a user in and saves the key in the keychain.
 */
- (void)loginWithUsername:(NSString *)username key:(NSString *)key;

/**
 @brief Logs the user out and removes their key from the keychain
*/
- (void)logout;

@end
