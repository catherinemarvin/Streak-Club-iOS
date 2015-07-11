//
//  KHHomeCollectionViewDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/27/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHHomeCollectionViewDataSource.h"

// View
#import "KHStreakCell.h"
#import "KHHomeStreakHeaderView.h"

// ViewModel
#import "KHStreakCellViewModel.h"

// Data Source
#import "KHHomeScreenDataSource.h"

// Models
#import "KHHomeStreaksModel.h"
#import "KHHomeStreaksGroup.h"
#import "KHStreakModel.h"

// External View
#import "KHStreakViewController.h"

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, KHHomeScreenSection) {
    KHHomeScreenSectionActiveStreaks = 0,
    KHHomeScreenSectionCreatedStreaks,
    KHHomeScreenSectionCompletedStreaks,
    KHHomeScreenSectionCount
};

@interface KHHomeCollectionViewDataSource ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, KHHomeScreenDataSourceDelegate>

@property (nonatomic, weak) id<KHHomeView>homeView;

@property (nonatomic, strong) KHHomeScreenDataSource *dataSource;

@property (nonatomic, strong) KHHomeStreaksModel *streaks;

@end

static NSString *const KHkHomeCellIdentifier = @"homeCellIdentifier";
static NSString *const KHkHeaderIdentifier = @"headerIdentifier";

static CGFloat const KHkMargin = 20.0f;

@implementation KHHomeCollectionViewDataSource

- (instancetype)init {
    return [self initWithHomeView:nil];
}

- (instancetype)initWithHomeView:(id<KHHomeView> __nonnull)homeView {
    NSParameterAssert(homeView);
    if (self = [super init]) {
        _homeView = homeView;
        
        UICollectionView *collectionView = [homeView collectionView];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        [collectionView registerClass:[KHStreakCell class] forCellWithReuseIdentifier:KHkHomeCellIdentifier];
        [collectionView registerClass:[KHHomeStreakHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:KHkHeaderIdentifier];
    }
    return self;
}

- (void)refreshData {
    [self.dataSource requestHomeScreen];
}

#pragma mark - Lazy Instantiation

- (KHHomeScreenDataSource *)dataSource {
    if (!_dataSource) {
        _dataSource = [[KHHomeScreenDataSource alloc] initWithDelegate:self];
    }
    return _dataSource;
}

#pragma mark - Data Source Manipulation

- (NSArray *)_createdStreaks {
    KHHomeStreaksGroup *createdStreakGroup = self.streaks.hostedStreaks;
    
    NSArray *ongoingStreaks = [createdStreakGroup activeStreaks];
    NSArray *completedStreaks = [createdStreakGroup completedStreaks];
    NSMutableArray *array = [NSMutableArray arrayWithArray:ongoingStreaks];
    [array addObjectsFromArray:completedStreaks];
    
    return [NSArray arrayWithArray:array];
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
            return [[self _createdStreaks] count];
            break;
        }
        case KHHomeScreenSectionCompletedStreaks: {
            return [self.streaks.joinedStreaks.completedStreaks count];
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
    
    if ([cell isKindOfClass:[KHStreakCell class]]) {
        KHStreakCell *homeStreakCell = (KHStreakCell *)cell;
        
        KHStreakModel *streak = [self _streakForIndexPath:indexPath];
        KHStreakCellViewModel *vm = [[KHStreakCellViewModel alloc] init];
        [vm configureWithStreak:streak];
        [homeStreakCell configureWithViewModel:vm];
    }
    return cell;
}

- (KHStreakModel *)_streakForIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *streaks;
    switch (indexPath.section) {
        case KHHomeScreenSectionActiveStreaks: {
            streaks = self.streaks.joinedStreaks.activeStreaks;
            break;
        }
        case KHHomeScreenSectionCreatedStreaks: {
            streaks = [self _createdStreaks];
            break;
        }
        case KHHomeScreenSectionCompletedStreaks: {
            streaks = self.streaks.joinedStreaks.completedStreaks;
            break;
        }
        case KHHomeScreenSectionCount:
        default: {
            break;
        }
    }
    KHStreakModel *streak = streaks[indexPath.row];
    return streak;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    CGFloat width = CGRectGetWidth(collectionView.bounds) - 2 * KHkMargin;
    CGFloat height = 50.0f;
    return CGSizeMake(width, height);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:KHkHeaderIdentifier forIndexPath:indexPath];
        if ([reusableView isKindOfClass:[KHHomeStreakHeaderView class]]) {
            KHHomeStreakHeaderView *headerView = (KHHomeStreakHeaderView *)reusableView;
            
            NSString *title;
            switch (indexPath.section) {
                case KHHomeScreenSectionActiveStreaks: {
                    title = NSLocalizedString(@"Active streaks you're in", @"Title for a group of all the streaks the user is currently in.");
                    break;
                }
                case KHHomeScreenSectionCreatedStreaks: {
                    title = NSLocalizedString(@"Streaks you've created", @"Title for a group of the streaks the user has created.");
                    break;
                }
                case KHHomeScreenSectionCompletedStreaks: {
                    title = NSLocalizedString(@"Streaks you've completed", @"Title for a group of streaks the user has completed");
                    break;
                }
                case KHHomeScreenSectionCount:
                default: {
                    break;
                }
            }
            [headerView setTitle:title];
        }
    }
    return reusableView;
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

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    KHStreakModel *streak = [self _streakForIndexPath:indexPath];
    
    KHStreakViewController *streakVC = [[KHStreakViewController alloc] initWithStreakModel:streak];
    
    [[self.homeView navigationController] pushViewController:streakVC animated:YES];
}

#pragma mark - KHHomeScreenDataSourceDelegate

- (void)homeStreaksReceived:(KHHomeStreaksModel * __nonnull)streaks {
    self.streaks = streaks;
    [[self.homeView collectionView] reloadData];
    [self.homeView endRefreshing];
}


@end

NS_ASSUME_NONNULL_END
