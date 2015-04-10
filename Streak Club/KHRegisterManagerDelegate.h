//
//  KHRegisterManagerDelegate.h
//  Streak Club
//
//  Created by Kevin Hwang on 3/30/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KHRegisterManagerDelegate <NSObject>

- (void)registerSucceededWithKey:(NSString *)key;

- (void)registerFailedWithError:(NSError *)error;

@end
