//
//  KHHomeScreenDataSource.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/16/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KHHomeScreenDataSourceDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHHomeScreenDataSource : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;

- (instancetype)initWithDelegate:(id<KHHomeScreenDataSourceDelegate>)delegate NS_DESIGNATED_INITIALIZER;

- (void)requestHomeScreen;

@end

NS_ASSUME_NONNULL_END