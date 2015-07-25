//
//  KHStreakTitleViewModel.h
//  Streak Club
//
//  Created by Kevin Hwang on 7/24/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KHStreakModel;

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakTitleViewModel : NSObject

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *shortDescription;

- (instancetype)initWithStreak:(KHStreakModel *)streak;

@end

NS_ASSUME_NONNULL_END