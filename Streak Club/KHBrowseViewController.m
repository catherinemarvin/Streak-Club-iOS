//
//  KHBrowseViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/27/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHBrowseViewController.h"

// Data Source
#import "KHBrowseCollectionViewDataSource.h"

// View Helper
#import <Masonry.h>

@interface KHBrowseViewController ()

@property (nonatomic, strong) KHBrowseCollectionViewDataSource *dataSource;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation KHBrowseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Browse", @"Title for the browse screen, where users can browse a list of streaks.");
    
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

- (KHBrowseCollectionViewDataSource *)dataSource {
    if (!_dataSource) {
        _dataSource = [[KHBrowseCollectionViewDataSource alloc] initWithCollectionView:self.collectionView];
    }
    return _dataSource;
}

#pragma mark - UIRefreshControl

- (void)_refreshControl:(id)sender {
    [self.dataSource refreshData];
}

@end
