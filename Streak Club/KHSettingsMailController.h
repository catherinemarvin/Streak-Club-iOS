//
//  KHSettingsMailController.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/20/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KHSettingsMailControllerDelegate.h"

@interface KHSettingsMailController : NSObject

- (instancetype)initWithDelegate:(id<KHSettingsMailControllerDelegate>)delegate NS_DESIGNATED_INITIALIZER;

- (void)createMailController;



@end
