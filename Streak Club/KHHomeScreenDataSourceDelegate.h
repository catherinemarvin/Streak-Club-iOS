//
//  KHHomeScreenDataSourceDelegate.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/16/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KHHomeScreenDataSourceDelegate <NSObject>

- (void)homeStreaksReceived:(NSArray *)streaks;

@end
NS_ASSUME_NONNULL_END
