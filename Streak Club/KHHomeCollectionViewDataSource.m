//
//  KHHomeCollectionViewDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/27/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHHomeCollectionViewDataSource.h"

// View
#import "KHHomeStreakCell.h"

// ViewModel
#import "KHHomeStreakCellViewModel.h"

// Data Source
#import "KHHomeScreenDataSource.h"

// Models
#import "KHHomeStreaksModel.h"
#import "KHHomeStreaksGroup.h"
#import "KHStreakModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, KHHomeScreenSection) {
    KHHomeScreenSectionActiveStreaks = 0,
    KHHomeScreenSectionCreatedStreaks,
    KHHomeScreenSectionCount
};

@interface KHHomeCollectionViewDataSource ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, KHHomeScreenDataSourceDelegate>

@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, strong) KHHomeScreenDataSource *dataSource;

@property (nonatomic, strong) KHHomeStreaksModel *streaks;

@end

static NSString *const KHkHomeCellIdentifier = @"homeCellIdentifier";

static CGFloat const KHkMargin = 20.0f;

@implementation KHHomeCollectionViewDataSource

- (instancetype)initWithCollectionView:(UICollectionView * __nonnull)collectionView {
    NSParameterAssert(collectionView);
    if (self = [super init]) {
        _dataSource = [[KHHomeScreenDataSource alloc] initWithDelegate:self];
        _collectionView = collectionView;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[KHHomeStreakCell class] forCellWithReuseIdentifier:KHkHomeCellIdentifier];
    }
    return self;
}

- (void)refreshData {
    [self.dataSource requestHomeScreen];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return KHHomeScreenSectionCount;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    KHHomeScreenSection homeScreenSection = section;
    switch (homeScreenSection) {
        case KHHomeScreenSectionActiveStreaks: {
            return [[[self.streaks joinedStreaks] activeStreaks] count];
            break;
        }
        case KHHomeScreenSectionCreatedStreaks: {
            return [[[self.streaks hostedStreaks] activeStreaks] count];
            break;
        }
        case KHHomeScreenSectionCount:
        default: {
            return 0;
            break;
        }
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KHkHomeCellIdentifier forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[KHHomeStreakCell class]]) {
        KHHomeStreakCell *homeStreakCell = (KHHomeStreakCell *)cell;
        
        KHStreakModel *streak = [self _streakForIndexPath:indexPath];
        KHHomeStreakCellViewModel *vm = [[KHHomeStreakCellViewModel alloc] init];
        [vm configureWithStreak:streak];
        [homeStreakCell configureWithViewModel:vm];
    }
    return cell;
}

- (KHStreakModel *)_streakForIndexPath:(NSIndexPath *)indexPath {
    
    KHHomeStreaksGroup *streakGroup;
    switch (indexPath.section) {
        case KHHomeScreenSectionActiveStreaks: {
            streakGroup = self.streaks.joinedStreaks;
            break;
        }
        case KHHomeScreenSectionCreatedStreaks: {
            streakGroup = self.streaks.hostedStreaks;
            break;
        }
        case KHHomeScreenSectionCount:
        default: {
            break;
        }
    }
    NSArray *activeStreaks = streakGroup.activeStreaks;
    NSArray *completedStreaks = streakGroup.completedStreaks;
    
    NSMutableArray *allStreaks = [NSMutableArray arrayWithArray:activeStreaks];
    [allStreaks addObjectsFromArray:completedStreaks];
    
    KHStreakModel *streak = allStreaks[indexPath.row];
    return streak;
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

#pragma mark - KHHomeScreenDataSourceDelegate

- (void)homeStreaksReceived:(KHHomeStreaksModel * __nonnull)streaks {
    self.streaks = streaks;
    [self.collectionView reloadData];
}

@end

NS_ASSUME_NONNULL_END
