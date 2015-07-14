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
#import "KHStreakDataSource.h"

// View Helpers
#import <Masonry/Masonry.h>



NS_ASSUME_NONNULL_BEGIN

@interface KHStreakViewController ()<KHStreakDataSourceDelegate>

@property (nonatomic, strong) KHStreakDataSource *dataSource;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

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
    [self.view addSubview:self.collectionView];
    [self.collectionView addSubview:self.refreshControl];
    
    [self.dataSource requestStreakViewModel];
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

#pragma mark - KHStreakDataSourceDelegate

- (void)updateWithStreakViewModel:(KHStreakViewModel *)viewModel {
    NSParameterAssert(viewModel);
    self.title = viewModel.title;
}

#pragma mark - UIRefreshControl

- (void)_refreshControl:(id)sender {
    //TODO: Refresh
}
@end

NS_ASSUME_NONNULL_END