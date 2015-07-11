//
//  KHStreakViewModel.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/9/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakViewModel.h"

// Model
#import "KHStreakModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakViewModel()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *shortDescription;

@end

@implementation KHStreakViewModel

- (void)configureWithStreak:(nonnull KHStreakModel *)streak {
    NSParameterAssert(streak);
    
    self.title = streak.title;
    self.shortDescription = streak.shortDescription;
}

@end

NS_ASSUME_NONNULL_END