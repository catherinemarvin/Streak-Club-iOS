//
//  KHStreakModuleTitleDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/24/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakModuleTitleDataSource.h"

// ViewModel
#import "KHStreakModuleTitleViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakModuleTitleDataSource()

@property (nonatomic, strong) KHStreakModel *streak;

@end

@implementation KHStreakModuleTitleDataSource

- (instancetype)initWithStreak:(nonnull KHStreakModel *)streak {
    NSParameterAssert(streak);
    
    if (self = [super init]) {
        _streak = streak;
    }
    return self;
}

- (KHStreakModuleTitleViewModel *)viewModel {
    return [[KHStreakModuleTitleViewModel alloc] initWithStreak:self.streak];
}

@end

NS_ASSUME_NONNULL_END