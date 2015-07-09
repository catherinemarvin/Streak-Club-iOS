//
//  KHHomeView.h
//  Streak Club
//
//  Created by Kevin Hwang on 7/6/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UICollectionView;
@class UINavigationController;

@protocol KHHomeView <NSObject>

- (UICollectionView *)collectionView;
- (void)endRefreshing;
- (UINavigationController *)navigationController;

@end
