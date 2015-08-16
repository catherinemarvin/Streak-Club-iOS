//
//  KHRecentSubmissionsDataSource.h
//  Streak Club
//
//  Created by Kevin Hwang on 8/15/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UICollectionView;

NS_ASSUME_NONNULL_BEGIN

@interface KHRecentSubmissionsDataSource : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithCollectionView:(UICollectionView *)collectionView;

@end

NS_ASSUME_NONNULL_END
