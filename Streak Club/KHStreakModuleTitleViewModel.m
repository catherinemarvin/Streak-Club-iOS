//
//  KHStreakTitleViewModel.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/24/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakModuleTitleViewModel.h"

// Model
#import "KHStreakModel.h"

NS_ASSUME_NONNULL_BEGIN

@implementation KHStreakModuleTitleViewModel

- (instancetype)initWithStreak:(nonnull KHStreakModel *)streak {
    NSParameterAssert(streak);
    
    if (self = [super init]) {
        _title = streak.title;
        _shortDescription = streak.shortDescription;
    }
    return self;
}

@end

NS_ASSUME_NONNULL_END