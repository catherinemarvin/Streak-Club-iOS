//
//  KHLoginManager.h
//  Streak Club
//
//  Created by Kevin Hwang on 3/30/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHLoginManagerDelegate.h"

@interface KHLoginManager : NSObject

- (instancetype)initWithDelegate:(id<KHLoginManagerDelegate>)delegate NS_DESIGNATED_INITIALIZER;

- (void)loginWithUsername:(NSString *)username password:(NSString *)password;

@end
