//
//  KHJoinStreakService.h
//  Streak Club
//
//  Created by Kevin Hwang on 7/29/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KHJoinStreakServiceDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHJoinStreakService : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithDelegate:(id<KHJoinStreakServiceDelegate>)delegate;

/**
 @brief Attempts to join a streak.
 @param remoteId The ID of the streak that the user is attempting to join
 */
- (void)joinStreakWithId:(NSNumber *)streakId;

@end

NS_ASSUME_NONNULL_END