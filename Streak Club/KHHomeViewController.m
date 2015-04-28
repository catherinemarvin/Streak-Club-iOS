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

@end

@implementation KHHomeViewController

- (instancetype)init {
    if (self = [super init]) {
        
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
    
    self.dataSource = [[KHHomeCollectionViewDataSource alloc] initWithCollectionView:self.collectionView];
    
    self.collectionView.dataSource = self.dataSource;
    
    [self.dataSource refreshData];
}

#pragma mark - KHHomeScreenDataSource

- (void)homeStreaksReceived:(NSArray * __nonnull)streaks {
    // Reload
}

@end
