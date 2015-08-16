//
//  KHRecentSubmissionsDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 8/15/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import "KHRecentSubmissionsDataSource.h"

// Collection View
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHRecentSubmissionsDataSource()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) UICollectionView *collectionView;

@end

static NSString *const KHkRecentSubmissionCellIdentifier = @"KHkRecentSubmissionCellIdentifier";

@implementation KHRecentSubmissionsDataSource

- (instancetype)initWithCollectionView:(nonnull UICollectionView *)collectionView {
    NSParameterAssert(collectionView);
    if (self = [super init]) {
        _collectionView = collectionView;
        collectionView.dataSource = self;
        collectionView.delegate = self;
    }
    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(nonnull UICollectionView *)collectionView {
    return 0;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KHkRecentSubmissionCellIdentifier forIndexPath:indexPath];
    return cell;
}

@end

NS_ASSUME_NONNULL_END