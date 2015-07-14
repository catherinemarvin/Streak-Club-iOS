//
//  KHStreakView.h
//  Streak Club
//
//  Created by Kevin Hwang on 7/13/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UICollectionView;
@class UINavigationController;

@protocol KHStreakView <NSObject>

- (UICollectionView *)collectionView;
- (void)endRefreshing;
- (UINavigationController *)navigationController;

@end
