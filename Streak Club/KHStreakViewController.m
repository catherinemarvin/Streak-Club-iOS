//
//  KHStreakViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/7/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakViewController.h"

// View Helpers
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakViewController ()

@end

@implementation KHStreakViewController

- (instancetype)initWithStreakModel:(KHStreakModel * __nonnull)streak {
    NSParameterAssert(streak);
    if (self = [super init]) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


@end

NS_ASSUME_NONNULL_END