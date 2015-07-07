//
//  KHHomeViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/6/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHHomeViewController.h"

// Data Source
#import "KHHomeCollectionViewDataSource.h"

// View
#import <Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHHomeViewController ()<KHHomeView>

@property (nonatomic, strong) KHHomeCollectionViewDataSource *dataSource;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation KHHomeViewController

- (instancetype)init {
    if (self = [super init]) {
        self.title = NSLocalizedString(@"Home", @"Title for the home screen");
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

- (KHHomeCollectionViewDataSource *)dataSource {
    if (!_dataSource) {
        _dataSource = [[KHHomeCollectionViewDataSource alloc] initWithHomeView:self];
    }
    return _dataSource;
}

#pragma mark - KHHomeView

- (void)endRefreshing {
    [self.refreshControl endRefreshing];
}

#pragma mark - UIRefreshControl

- (void)_refreshControl:(id)sender {
    [self.dataSource refreshData];
}

@end

NS_ASSUME_NONNULL_END
