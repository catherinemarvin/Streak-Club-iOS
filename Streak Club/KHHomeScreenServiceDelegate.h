//
//  KHHomeScreenServiceDelegate.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/8/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class KHHomeStreaksModel;

@protocol KHHomeScreenServiceDelegate <NSObject>

- (void)homeStreaksReceived:(KHHomeStreaksModel *)streaks;

@end

NS_ASSUME_NONNULL_END
