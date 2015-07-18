//
//  KHStreakCollectionViewDataSource.h
//  Streak Club
//
//  Created by Kevin Hwang on 7/13/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KHStreakView.h"

@class KHStreakModel;

@interface KHStreakCollectionViewDataSource : NSObject

- (instancetype)initWithStreak:(KHStreakModel *)streak view:(id<KHStreakView>)streakView NS_DESIGNATED_INITIALIZER;

- (void)refreshData;

@end