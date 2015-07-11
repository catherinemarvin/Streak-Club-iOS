//
//  KHStreakViewModel.h
//  Streak Club
//
//  Created by Kevin Hwang on 7/9/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KHStreakModel;

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakViewModel : NSObject

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *shortDescription;

- (void)configureWithStreak:(KHStreakModel *)streak;

@end

NS_ASSUME_NONNULL_END