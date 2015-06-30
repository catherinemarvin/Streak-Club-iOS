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

NS_ASSUME_NONNULL_BEGIN

@interface KHBrowseCollectionViewDataSource()<KHBrowseDataSourceDelegate>

@property (nonatomic, strong) KHBrowseDataSource *dataSource;
@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, strong) KHBrowseStreaksModel *browseStreaks;

@end

static NSString *const KHkBrowseCellIdentifier = @"KHkBrowseCellIdentifier";

@implementation KHBrowseCollectionViewDataSource

- (instancetype)initWithCollectionView:(UICollectionView * __nonnull)collectionView {
    NSParameterAssert(collectionView);
    if (self = [super init]) {
        _collectionView = collectionView;
        _collectionView.dataSource = self;
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
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KHkBrowseCellIdentifier forIndexPath:indexPath];
    return cell;
}

#pragma mark - KHBrowseDataSourceDelegate

- (void)browseStreaksReceived:(KHBrowseStreaksModel *)browseStreaks {
    self.browseStreaks = browseStreaks;
    [self.collectionView reloadData];
}


@end

NS_ASSUME_NONNULL_END