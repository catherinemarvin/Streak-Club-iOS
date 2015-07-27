//
//  KHStreakSubmissionsService.h
//  Streak Club
//
//  Created by Kevin Hwang on 7/24/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHStreakSubmissionsServiceDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakSubmissionsService : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithStreakId:(NSNumber *)streakId delegate:(id<KHStreakSubmissionsServiceDelegate>)delegate;

/**
 @brief Requests the submissions that have been made for a given streak.
 */
- (void)requestSubmissions;

@end

NS_ASSUME_NONNULL_END