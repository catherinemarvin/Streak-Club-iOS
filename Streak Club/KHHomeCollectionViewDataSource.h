//
//  KHHomeCollectionViewDataSource.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/27/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHHomeCollectionViewDataSource : NSObject<UICollectionViewDataSource>

- (instancetype)init UNAVAILABLE_ATTRIBUTE;

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView NS_DESIGNATED_INITIALIZER;

- (void)refreshData;


@end

NS_ASSUME_NONNULL_END