//
//  KHHomeViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/6/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHHomeViewController.h"

// Data Source
#import "KHHomeScreenDataSource.h"

// View
#import <Masonry.h>

@interface KHHomeViewController ()<KHHomeScreenDataSourceDelegate>

@property (nonatomic, strong) KHHomeScreenDataSource *dataSource;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation KHHomeViewController

- (instancetype)init {
    if (self = [super init]) {
        _dataSource = [[KHHomeScreenDataSource alloc] initWithDelegate:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView = ({
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView;
    });
    [self.view addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

@end
