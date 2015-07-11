//
//  KHStreakDataSource.h
//  Streak Club
//
//  Created by Kevin Hwang on 7/9/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KHStreakDataSourceDelegate.h"

@class KHStreakModel;

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakDataSource : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithStreak:(KHStreakModel *)streak delegate:(id<KHStreakDataSourceDelegate>)delegate;

- (void)requestStreakViewModel;

@end

NS_ASSUME_NONNULL_END