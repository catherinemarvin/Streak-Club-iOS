//
//  KHStreakScreenDataSource.h
//  Streak Club
//
//  Created by Kevin Hwang on 7/24/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KHStreakModel;

NS_ASSUME_NONNULL_BEGIN

/**
 @brief Responsible for coordinating all of the module data sources.
 */

@interface KHStreakScreenDataSource : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithStreakModel:(KHStreakModel *)streakModel;

@end

NS_ASSUME_NONNULL_END