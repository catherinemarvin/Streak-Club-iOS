//
//  KHHomeStreakCellViewModel.h
//  Streak Club
//
//  Created by Kevin Hwang on 5/5/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KHStreakModel;

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakCellViewModel : NSObject

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *author;
@property (nonatomic, strong, readonly) NSString *duration;
@property (nonatomic, assign, readonly) float progressPercentage;
@property (nonatomic, assign, readonly) BOOL draft;
@property (nonatomic, assign, readonly) NSInteger participants;
@property (nonatomic, assign, readonly) NSInteger submissions;

- (void)configureWithStreak:(KHStreakModel *)streak;

@end

NS_ASSUME_NONNULL_END
