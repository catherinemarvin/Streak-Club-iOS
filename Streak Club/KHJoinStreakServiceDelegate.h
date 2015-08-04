//
//  KHJoinStreakServiceDelegate.h
//  Streak Club
//
//  Created by Kevin Hwang on 7/30/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KHJoinStreakServiceDelegate <NSObject>

/**
 @brief Indicates that the streak with this ID has been joined.
 @param streakId The ID of the streak that the user has joined.
 */
- (void)streakJoined:(NSNumber *)streakId;

@end

NS_ASSUME_NONNULL_END