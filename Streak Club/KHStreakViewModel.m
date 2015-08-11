//
//  KHStreakViewModel.m
//  Streak Club
//
//  Created by Kevin Hwang on 8/4/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@implementation KHStreakViewModel

- (instancetype)initWithTitle:(NSString *)title titleVM:(KHStreakTitleViewModel *)titleVM moduleSelectorVM:(KHStreakModuleSelectorViewModel *)moduleSelectorVM {
    NSParameterAssert(title);
    NSParameterAssert(titleVM);
    NSParameterAssert(moduleSelectorVM);
    
    if (self = [super init]) {
        _title = title;
        _titleViewModel = titleVM;
        _moduleSelectorViewModel = moduleSelectorVM;
    }
    return self;
}

@end

NS_ASSUME_NONNULL_END