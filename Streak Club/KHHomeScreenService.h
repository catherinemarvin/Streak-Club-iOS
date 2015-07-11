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

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithDelegate:(id<KHHomeScreenServiceDelegate>)delegate NS_DESIGNATED_INITIALIZER;

/**
 @brief Requests the streaks that should be displayed on the home page.
 */
- (void)requestHomePage;

@end