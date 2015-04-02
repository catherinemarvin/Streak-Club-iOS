//
//  KHRegisterService.h
//  Streak Club
//
//  Created by Kevin Hwang on 3/29/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHRegisterServiceDelegate.h"

@interface KHRegisterService : NSObject

- (instancetype)initWithDelegate:(id<KHRegisterServiceDelegate>)delegate NS_DESIGNATED_INITIALIZER;

- (void)registerWithUsername:(NSString *)username password:(NSString *)password repeatPassword:(NSString *)repeatPassword email:(NSString *)email;

@end
