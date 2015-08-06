//
//  KHStreakScreenDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/24/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakScreenDataSource.h"

// Module Data sources
#import "KHStreakScreenTitleModuleDataSource.h"

// ViewModels
#import "KHStreakViewModel.h"
#import "KHStreakTitleViewModel.h"

// Models
#import "KHStreakModel.h"

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

- (KHStreakViewModel *)viewModel {
    NSString *title = [self.streakModel title];
    KHStreakTitleViewModel *titleVM = [[self titleModuleDataSource] viewModel];
    KHStreakViewModel *vm = [[KHStreakViewModel alloc] initWithTitle:title titleVM:titleVM];
    return vm;
}

#pragma mark - Data Sources

- (KHStreakScreenTitleModuleDataSource *)titleModuleDataSource {
    KHStreakScreenTitleModuleDataSource *dataSource = [[KHStreakScreenTitleModuleDataSource alloc] initWithStreakModel:self.streakModel];
    return dataSource;
}

@end

NS_ASSUME_NONNULL_END