//
//  KHHomeScreenDataSource.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/16/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KHHomeScreenDataSourceDelegate.h"

@interface KHHomeScreenDataSource : NSObject

- (instancetype)initWithDelegate:(id<KHHomeScreenDataSourceDelegate>)delegate NS_DESIGNATED_INITIALIZER;

@end
