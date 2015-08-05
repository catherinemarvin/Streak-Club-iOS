//
//  KHStreakScreenDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/24/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakScreenDataSource.h"

// Module Data sources

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakScreenDataSource()

@property (nonatomic, strong) KHStreakModel *streakModel;

@end

@implementation KHStreakScreenDataSource

- (instancetype)initWithStreakModel:(nonnull KHStreakModel *)streakModel {
    NSParameterAssert(streakModel);
    if (self = [super init]) {
        _streakModel = streakModel;
    }
    return self;
}

@end

NS_ASSUME_NONNULL_END