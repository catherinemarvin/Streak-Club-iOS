//
//  KHStreakModuleSelectorDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 8/10/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakModuleSelectorDataSource.h"

// ViewModel
#import "KHStreakModuleSelectorViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@implementation KHStreakModuleSelectorDataSource

- (KHStreakModuleSelectorViewModel *)viewModel {
    KHStreakModuleSelectorViewModel *vm = [[KHStreakModuleSelectorViewModel alloc] init];
    return vm;
}

@end

NS_ASSUME_NONNULL_END