//
//  KHBrowseDataSource.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/27/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KHBrowseDataSourceDelegate.h"

NS_ASSUME_NONNULL_BEGIN
@interface KHBrowseDataSource : NSObject

- (instancetype)initWithDelegate:(id<KHBrowseDataSourceDelegate>)delegate NS_DESIGNATED_INITIALIZER;

@end
NS_ASSUME_NONNULL_END
