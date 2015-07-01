//
//  KHBrowseCollectionViewDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 5/10/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHBrowseCollectionViewDataSource.h"

// Data Source
#import "KHBrowseDataSource.h"

// Models
#import "KHBrowseStreaksModel.h"

// Views
#import "KHStreakCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHBrowseCollectionViewDataSource()<KHBrowseDataSourceDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) KHBrowseDataSource *dataSource;
@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, strong) KHBrowseStreaksModel *browseStreaks;

@end

static NSString *const KHkBrowseCellIdentifier = @"KHkBrowseCellIdentifier";
static CGFloat const KHkMargin = 20.0f;

@implementation KHBrowseCollectionViewDataSource

- (instancetype)initWithCollectionView:(UICollectionView * __nonnull)collectionView {
    NSParameterAssert(collectionView);
    if (self = [super init]) {
        _collectionView = collectionView;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[KHStreakCell class] forCellWithReuseIdentifier:KHkBrowseCellIdentifier];
    }
    return self;
}

- (void)refreshData {
    [self.dataSource requestBrowseScreen];
}

#pragma mark - Lazy Instantiation

- (KHBrowseDataSource *)dataSource {
    if (!_dataSource) {
        _dataSource = [[KHBrowseDataSource alloc] initWithDelegate:self];
    }
    return _dataSource;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.browseStreaks.streaks count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KHkBrowseCellIdentifier forIndexPath:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegateCollectionFlowLayout 

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = CGRectGetWidth(collectionView.bounds) - 2 * KHkMargin;
    CGFloat height = 200.0f;
    return CGSizeMake(width, height);
}

#pragma mark - KHBrowseDataSourceDelegate

- (void)browseStreaksReceived:(KHBrowseStreaksModel *)browseStreaks {
    self.browseStreaks = browseStreaks;
    [self.collectionView reloadData];
}


@end

NS_ASSUME_NONNULL_END