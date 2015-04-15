//
//  KHHomeScreenService.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/8/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHHomeScreenServiceDelegate.h"

@interface KHHomeScreenService : NSObject

- (instancetype)initWithDelegate:(id<KHHomeScreenServiceDelegate>)delegate NS_DESIGNATED_INITIALIZER;

- (void)requestHomePage;

@end
