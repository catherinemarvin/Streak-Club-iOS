//
//  KHStreakScreenTitleModuleDataSource.h
//  Streak Club
//
//  Created by Kevin Hwang on 8/4/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KHStreakModel;
@class KHStreakTitleViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakScreenTitleModuleDataSource : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithStreakModel:(KHStreakModel *)streakModel;

- (KHStreakTitleViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END