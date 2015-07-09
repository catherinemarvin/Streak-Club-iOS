//
//  KHStreakViewController.h
//  Streak Club
//
//  Created by Kevin Hwang on 7/7/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KHStreakModel;

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakViewController : UIViewController

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithStreakModel:(KHStreakModel *)streak;

@end

NS_ASSUME_NONNULL_END