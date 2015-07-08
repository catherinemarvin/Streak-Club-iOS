//
//  KHStreakViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/7/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakViewController.h"

// Views
#import "KHStreakView.h"

// View Helpers
#import <Masonry/Masonry.h>

@interface KHStreakViewController ()

@property (nonatomic, strong) KHStreakView *streakView;

@end

@implementation KHStreakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.streakView];
    [self.streakView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Lazy Instantiation

- (KHStreakView *)streakView {
    if (!_streakView) {
        _streakView = [[KHStreakView alloc] init];
    }
    return _streakView;
}


@end
