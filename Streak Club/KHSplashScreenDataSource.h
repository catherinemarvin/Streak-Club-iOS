//
//  KHSplashScreenDataSource.h
//  Streak Club
//
//  Created by Kevin Hwang on 3/25/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KHSplashScreenViewInfo;

@interface KHSplashScreenDataSource : NSObject

- (KHSplashScreenViewInfo *)viewInfoForIndex:(NSUInteger)index;

/// @brief Returns the number of splash screens there are.
- (NSUInteger)count;

@end
