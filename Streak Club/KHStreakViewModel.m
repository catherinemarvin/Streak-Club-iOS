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

- (instancetype)initWithTitle:(NSString *)title titleVM:(KHStreakTitleViewModel *)titleVM {
    NSParameterAssert(titleVM);
    NSParameterAssert(titleVM);
    
    if (self = [super init]) {
        _title = title;
        _titleViewModel = titleVM;
    }
    return self;
}

@end

NS_ASSUME_NONNULL_END