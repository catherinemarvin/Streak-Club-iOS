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

@interface KHHomeStreakCellViewModel : NSObject

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *author;
@property (nonatomic, strong, readonly) NSString *duration;
@property (nonatomic, strong, readonly) NSString *participants;
@property (nonatomic, strong, readonly) NSString *submissions;

- (void)configureWithStreak:(KHStreakModel *)streak;

@end

NS_ASSUME_NONNULL_END
