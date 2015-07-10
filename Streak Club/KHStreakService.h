//
//  KHStreakService.h
//  Streak Club
//
//  Created by Kevin Hwang on 7/9/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHStreakServiceDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakService : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithDelegate:(id<KHStreakServiceDelegate>)delegate NS_DESIGNATED_INITIALIZER;

/**
 @brief Requests detailed information about a streak.
 */
- (void)requestStreakInfo;

@end

NS_ASSUME_NONNULL_END