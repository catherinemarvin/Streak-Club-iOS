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

@interface KHHomeViewController ()

@property (nonatomic, strong) KHHomeCollectionViewDataSource *dataSource;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation KHHomeViewController

- (instancetype)init {
    if (self = [super init]) {
        self.title = NSLocalizedString(@"Home", nil);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView = ({
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.alwaysBounceVertical = YES;
        collectionView;
    });
    [self.view addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.refreshControl = ({
        UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
        [refreshControl addTarget:self action:@selector(_refreshControl:) forControlEvents:UIControlEventValueChanged];
        refreshControl;
    });
    [self.collectionView addSubview:self.refreshControl];
    
    self.dataSource = [[KHHomeCollectionViewDataSource alloc] initWithCollectionView:self.collectionView];
    [self.dataSource refreshData];
}

#pragma mark - UIRefreshControl

- (void)_refreshControl:(id)sender {
    [self.dataSource refreshData];
}

@end
