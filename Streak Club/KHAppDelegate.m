//
//  AppDelegate.m
//  Streak Club
//
//  Created by Kevin Hwang on 1/26/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHAppDelegate.h"

// Session
#import "KHSessionManager.h"

// Views
#import "KHSplashScreenViewController.h"
#import "KHGlobalTabBarViewController.h"

@interface KHAppDelegate ()

@end

@implementation KHAppDelegate

- (void)dealloc {
    [[KHSessionManager sharedInstance] removeObserver:self forKeyPath:NSStringFromSelector(@selector(loggedIn))];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    
    UIViewController *mainScreen;
    
    KHSessionManager *sessionManager = [KHSessionManager sharedInstance];
    if ([sessionManager loggedIn]) {
        mainScreen = [[KHGlobalTabBarViewController alloc] init];
    } else {
        mainScreen = [[KHSplashScreenViewController alloc] init];
    }
    
    [sessionManager addObserver:self forKeyPath:NSStringFromSelector(@selector(loggedIn)) options:0 context:nil];
    
    self.window.rootViewController = mainScreen;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(loggedIn))]) {
        if (![[KHSessionManager sharedInstance] loggedIn]) {
            // If you logged out, dump back to the splash screen
            self.window.rootViewController = [[KHSplashScreenViewController alloc] init];
        }
    }
}

@end
