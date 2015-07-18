//
//  KHStreakViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/7/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakViewController.h"

// ViewModel
#import "KHStreakViewModel.h"

// Data Source
#import "KHStreakCollectionViewDataSource.h"

// View Helpers
#import <Masonry/Masonry.h>



NS_ASSUME_NONNULL_BEGIN

@interface KHStreakViewController ()<KHStreakView>

@property (nonatomic, strong) KHStreakCollectionViewDataSource *dataSource;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation KHStreakViewController

- (instancetype)initWithStreakModel:(KHStreakModel * __nonnull)streak {
    NSParameterAssert(streak);
    if (self = [super init]) {
        _dataSource = [[KHStreakCollectionViewDataSource alloc] initWithStreak:streak view:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.collectionView addSubview:self.refreshControl];
    
    [self.dataSource refreshData];
}

#pragma mark - Lazy Instantiation

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = ({
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
            UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
            collectionView.backgroundColor = [UIColor whiteColor];
            collectionView.alwaysBounceVertical = YES;
            collectionView;
        });
    }
    return _collectionView;
}

- (UIRefreshControl *)refreshControl {
    if (!_refreshControl) {
        _refreshControl = ({
            UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
            [refreshControl addTarget:self action:@selector(_refreshControl:) forControlEvents:UIControlEventValueChanged];
            refreshControl;
        });
    }
    return _refreshControl;
}

#pragma mark - KHStreakView 

- (void)endRefreshing {
    
}

#pragma mark - UIRefreshControl

- (void)_refreshControl:(id)sender {
    //TODO: Refresh
}

@end

NS_ASSUME_NONNULL_END