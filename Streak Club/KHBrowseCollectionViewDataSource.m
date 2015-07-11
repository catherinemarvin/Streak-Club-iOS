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
#import "KHStreakModel.h"

// Views
#import "KHStreakCell.h"

// ViewModel
#import "KHStreakCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHBrowseCollectionViewDataSource()<KHBrowseDataSourceDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) id<KHBrowseView> browseView;
@property (nonatomic, strong) KHBrowseDataSource *dataSource;
@property (nonatomic, strong) KHBrowseStreaksModel *browseStreaks;

@end

static NSString *const KHkBrowseCellIdentifier = @"KHkBrowseCellIdentifier";
static CGFloat const KHkMargin = 20.0f;

@implementation KHBrowseCollectionViewDataSource

- (instancetype)init {
    id<KHBrowseView>browseView;
    return [self initWithBrowseView:browseView];
}

- (instancetype)initWithBrowseView:(id<KHBrowseView> __nonnull)browseView {
    NSParameterAssert(browseView);
    if (self = [super init]) {
        _browseView = browseView;
        
        UICollectionView *collectionView = [browseView collectionView];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        [collectionView registerClass:[KHStreakCell class] forCellWithReuseIdentifier:KHkBrowseCellIdentifier];
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
    
    if ([cell isKindOfClass:[KHStreakCell class]]) {
        KHStreakCell *streakCell = (KHStreakCell *)cell;
        KHStreakModel *streak = self.browseStreaks.streaks[indexPath.row];
        
        KHStreakCellViewModel *vm = [[KHStreakCellViewModel alloc] init];
        [vm configureWithStreak:streak];
        [streakCell configureWithViewModel:vm];
    }
    return cell;
}

#pragma mark - UICollectionViewDelegateCollectionFlowLayout 

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = CGRectGetWidth(collectionView.bounds) - 2 * KHkMargin;
    CGFloat height = 200.0f;
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(KHkMargin, 0, 0, 0);
}

#pragma mark - KHBrowseDataSourceDelegate

- (void)browseStreaksReceived:(KHBrowseStreaksModel *)browseStreaks {
    self.browseStreaks = browseStreaks;
    [[self.browseView collectionView] reloadData];
    [self.browseView endRefreshing];
}


@end

NS_ASSUME_NONNULL_END