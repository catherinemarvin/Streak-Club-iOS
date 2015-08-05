//
//  KHStreakTitleViewModel.m
//  Streak Club
//
//  Created by Kevin Hwang on 8/4/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakTitleViewModel.h"

// Model
#import "KHStreakModel.h"

NS_ASSUME_NONNULL_BEGIN

@implementation KHStreakTitleViewModel

- (instancetype)initWithStreakModel:(nonnull KHStreakModel *)streakModel {
    NSParameterAssert(streakModel);
    
    if (self = [super init]) {
        _titleText = streakModel.title;
        _shortDescriptionText = streakModel.shortDescription;
    }
    return self;
}

@end

NS_ASSUME_NONNULL_END