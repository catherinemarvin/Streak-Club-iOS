//
//  KHStreakModuleSelectorView.h
//  Streak Club
//
//  Created by Kevin Hwang on 8/8/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KHStreakModuleSelectorViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakModuleSelectorView : UIView

- (void)configureWithViewModel:(KHStreakModuleSelectorViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END