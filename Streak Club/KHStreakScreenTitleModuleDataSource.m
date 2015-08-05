//
//  KHStreakScreenTitleModuleDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 8/4/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakScreenTitleModuleDataSource.h"

// ViewModel
#import "KHStreakTitleViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakScreenTitleModuleDataSource()

@property (nonatomic, strong) KHStreakModel *streakModel;

@end

@implementation KHStreakScreenTitleModuleDataSource

- (instancetype)initWithStreakModel:(nonnull KHStreakModel *)streakModel {
    NSParameterAssert(streakModel);
    
    if (self = [super init]) {
        _streakModel = streakModel;
    }
    return self;
}

- (KHStreakTitleViewModel *)viewModel {
    KHStreakTitleViewModel *vm = [[KHStreakTitleViewModel alloc] initWithStreakModel:self.streakModel];
    return vm;
}

@end

NS_ASSUME_NONNULL_END
