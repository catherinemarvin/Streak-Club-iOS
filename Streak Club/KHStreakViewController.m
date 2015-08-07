//
//  KHStreakViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/7/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakViewController.h"

// Data Source
#import "KHStreakScreenDataSource.h"

// View
#import "KHStreakView.h"

// ViewModel
#import "KHStreakViewModel.h"

// View Helpers
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakViewController ()

@property (nonatomic, strong) KHStreakScreenDataSource *dataSource;
@property (nonatomic, strong) KHStreakView *streakView;

@end

@implementation KHStreakViewController

- (instancetype)initWithStreakModel:(KHStreakModel * __nonnull)streak {
    NSParameterAssert(streak);
    if (self = [super init]) {
        _dataSource = [[KHStreakScreenDataSource alloc] initWithStreakModel:streak];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.streakView];
    [self.streakView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    KHStreakViewModel *vm = [self.dataSource viewModel];
    
    self.title = vm.title;
    [self.streakView configureWithViewModel:vm];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBar.translucent = YES;
}

#pragma mark - Lazy Instantiation

- (KHStreakView *)streakView {
    if (!_streakView) {
        _streakView = [[KHStreakView alloc] init];
    }
    return _streakView;
}


@end

NS_ASSUME_NONNULL_END