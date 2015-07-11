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

// Data Source
#import "KHStreakDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakViewController ()<KHStreakDataSourceDelegate>

@property (nonatomic, strong) KHStreakDataSource *dataSource;
@property (nonatomic, strong) KHStreakView *streakView;

@end

@implementation KHStreakViewController

- (instancetype)initWithStreakModel:(KHStreakModel * __nonnull)streak {
    NSParameterAssert(streak);
    if (self = [super init]) {
        _dataSource = [[KHStreakDataSource alloc] initWithStreak:streak delegate:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.streakView];
    [self.streakView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.dataSource requestStreakViewModel];
}

#pragma mark - Lazy Instantiation

- (KHStreakView *)streakView {
    if (!_streakView) {
        _streakView = [[KHStreakView alloc] init];
    }
    return _streakView;
}

#pragma mark - KHStreakDataSourceDelegate

- (void)updateWithStreakViewModel:(KHStreakViewModel *)viewModel {
   //TODO: Configure view with VM
}

@end

NS_ASSUME_NONNULL_END