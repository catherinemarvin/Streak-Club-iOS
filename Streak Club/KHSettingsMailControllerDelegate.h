//
//  KHSettingsMailControllerDelegate.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/20/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;

@protocol KHSettingsMailControllerDelegate <NSObject>

- (void)cannotSendMail;

- (void)mailControllerCreated:(UIViewController *)mailController;


@end
