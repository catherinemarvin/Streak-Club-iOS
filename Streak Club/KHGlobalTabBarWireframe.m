//
//  KHGlobalTabBarWireframe.m
//  Streak Club
//
//  Created by Kevin Hwang on 5/7/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHGlobalTabBarWireframe.h"

// Views
#import "KHGlobalTabBarViewController.h"

// App Delegate
#import "KHAppDelegate.h"

@implementation KHGlobalTabBarWireframe

- (void)presentMainView {
    KHGlobalTabBarViewController *vc = [[KHGlobalTabBarViewController alloc] init];
    
    id<UIApplicationDelegate> delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate isKindOfClass:[KHAppDelegate class]]) {
        KHAppDelegate *appDelegate = (KHAppDelegate *)delegate;
        appDelegate.window.rootViewController = vc;
    }
}

@end
