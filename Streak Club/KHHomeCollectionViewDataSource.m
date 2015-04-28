//
//  KHHomeCollectionViewDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/27/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHHomeCollectionViewDataSource.h"

// Data Source
#import "KHHomeScreenDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHHomeCollectionViewDataSource ()<KHHomeScreenDataSourceDelegate>

@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, strong) KHHomeScreenDataSource *dataSource;

@property (nonatomic, strong) NSArray *streaks;

@end

static NSString *const KHkHomeCellIdentifier = @"homeCellIdentifier";

@implementation KHHomeCollectionViewDataSource

- (instancetype)initWithCollectionView:(UICollectionView * __nonnull)collectionView {
    NSParameterAssert(collectionView);
    if (self = [super init]) {
        _dataSource = [[KHHomeScreenDataSource alloc] initWithDelegate:self];
        _collectionView = collectionView;
        _collectionView.dataSource = self;
    }
    return self;
}

- (void)refreshData {
    [self.dataSource requestHomeScreen];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.streaks.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KHkHomeCellIdentifier forIndexPath:indexPath];
    return cell;
}

#pragma mark - KHHomeScreenDataSourceDelegate

- (void)homeStreaksReceived:(NSArray * __nonnull)streaks {
    self.streaks = streaks;
    [self.collectionView reloadData];
}

@end

NS_ASSUME_NONNULL_END
