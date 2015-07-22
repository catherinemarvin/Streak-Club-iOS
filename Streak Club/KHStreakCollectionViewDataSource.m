//
//  KHStreakCollectionViewDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/13/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakCollectionViewDataSource.h"

// Data Source
#import "KHStreakDataSource.h"

// Model
#import "KHStreakModel.h"

// UI
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, KHStreakModule) {
    KHStreakModuleTitle = 0,
    KHStreakModuleCount
};

@interface KHStreakCollectionViewDataSource()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, KHStreakDataSourceDelegate>

@property (nonatomic, weak) KHStreakModel *streak;
@property (nonatomic, weak) id<KHStreakView> streakView;
@property (nonatomic, strong) KHStreakDataSource *dataSource;

@end

static NSString *const KHkStreakModuleTitleReuseIdentifier = @"KHkStreakModuleTitleReuseIdentifier";

@implementation KHStreakCollectionViewDataSource

- (instancetype)init {
    return [self initWithStreak:nil view:nil];
}

- (instancetype)initWithStreak:(KHStreakModel *)streak view:(id<KHStreakView>)streakView {
    NSParameterAssert(streak);
    NSParameterAssert(streakView);
    if (self = [super init]) {
        _streak = streak;
        _streakView = streakView;
        UICollectionView *collectionView = [streakView collectionView];
        
        collectionView.dataSource = self;
        collectionView.delegate = self;
    }
    return self;
}

#pragma mark - Public Methods

- (void)refreshData {
   
}

#pragma mark - Lazy Instantiation

- (KHStreakDataSource *)dataSource {
    if (!_dataSource) {
        _dataSource = [[KHStreakDataSource alloc] initWithStreak:self.streak delegate:self];
    }
    return _dataSource;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(nonnull UICollectionView *)collectionView {
    //TODO: Fill in
    return 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return KHStreakModuleCount;
}

- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    KHStreakModule module = indexPath.row;
    NSString *reuseIdentifier = [self _reuseIdentifierForModule:module];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    return cell;
}

- (NSString *)_reuseIdentifierForModule:(KHStreakModule)module {
    NSString *reuseIdentifier;
    
    switch (module) {
        case KHStreakModuleTitle:
            reuseIdentifier = KHkStreakModuleTitleReuseIdentifier;
        case KHStreakModuleCount: {
            // Should not get here
        }
    }
    return reuseIdentifier;
}

#pragma mark - UICollectionViewDelegateCollectionFlowLayout

- (CGSize)collectionView:(nonnull UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //TODO: Fill in
    return CGSizeZero;
}

#pragma mark - KHStreakDataSourceDelegate

- (void)updateWithStreakViewModel:(KHStreakViewModel *)viewModel {
   //TODO: Update appropriate cell
}

@end

NS_ASSUME_NONNULL_END