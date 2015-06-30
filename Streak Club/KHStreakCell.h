//
//  KHHomeStreakCell.h
//  Streak Club
//
//  Created by Kevin Hwang on 5/1/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KHStreakCellViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakCell : UICollectionViewCell

- (void)configureWithViewModel:(KHStreakCellViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END