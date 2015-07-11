//
//  KHStreakView.h
//  Streak Club
//
//  Created by Kevin Hwang on 7/7/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KHStreakViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakView : UIView

/**
 @brief Updates this view with the data in a given ViewModel
 */
- (void)configureWithStreakViewModel:(KHStreakViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END