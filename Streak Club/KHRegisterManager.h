//
//  KHRegisterManager.h
//  Streak Club
//
//  Created by Kevin Hwang on 3/30/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHRegisterManagerDelegate.h"

@interface KHRegisterManager : NSObject

- (instancetype)initWithDelegate:(id<KHRegisterManagerDelegate>)delegate NS_DESIGNATED_INITIALIZER;

- (void)registerWithUsername:(NSString *)username password:(NSString *)password repeatPassword:(NSString *)repeatPassword email:(NSString *)email;

@end
