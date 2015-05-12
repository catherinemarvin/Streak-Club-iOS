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

@end

@implementation KHBrowseViewController

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
