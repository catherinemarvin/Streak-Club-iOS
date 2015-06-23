//
//  KHSplashScreenContent.h
//  Streak Club
//
//  Created by Kevin Hwang on 6/22/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KHSplashScreenViewController;

@protocol KHSplashScreenContent <NSObject>

@property (nonatomic, weak) KHSplashScreenViewController *splashScreenVC;

@end
