//
//  KHStreakTitleView.h
//  Streak Club
//
//  Created by Kevin Hwang on 8/4/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KHStreakTitleViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakTitleView : UIView

- (void)configureWithViewModel:(KHStreakTitleViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END