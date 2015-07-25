//
//  KHStreakModuleTitleDataSource.h
//  Streak Club
//
//  Created by Kevin Hwang on 7/24/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KHStreakModel;
@class KHStreakModuleTitleViewModel;

NS_ASSUME_NONNULL_BEGIN

/**
 @brief Responsible for configuring the header
 */

@interface KHStreakModuleTitleDataSource : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithStreak:(KHStreakModel *)streak;

- (KHStreakModuleTitleViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END