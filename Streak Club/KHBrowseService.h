//
//  KHBrowseService.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/27/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KHBrowseServiceDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHBrowseService : NSObject

- (instancetype)initWithDelegate:(id<KHBrowseServiceDelegate>)delegate NS_DESIGNATED_INITIALIZER;

- (void)requestBrowse;

@end

NS_ASSUME_NONNULL_END
