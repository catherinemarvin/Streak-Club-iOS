//
//  KHGlobalTabBarViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/5/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHGlobalTabBarViewController.h"

// Tab Bar Sections
#import "KHHomeViewController.h"
#import "KHSettingsViewController.h"

typedef NS_ENUM(NSInteger, KHGlobalTabBarSection) {
    KHGlobalTabBarSectionHome,
    KHGlobalTabBarSectionSettings
};

@interface KHGlobalTabBarViewController ()

@property (nonatomic, strong) KHHomeViewController *homeViewController;
@property (nonatomic, strong) KHSettingsViewController *settingsViewController;

@end

@implementation KHGlobalTabBarViewController

- (instancetype)init {
    if (self = [super init]) {
        _homeViewController = [[KHHomeViewController alloc] init];
        _homeViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"Home", nil) image:[UIImage imageNamed:@"homeTabIcon"] tag:KHGlobalTabBarSectionHome];
        UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:_homeViewController];
        
        _settingsViewController = [[KHSettingsViewController alloc] init];
        _settingsViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"Settings", nil) image:[UIImage imageNamed:@"settingsTabIcon"] tag:KHGlobalTabBarSectionSettings];
        UINavigationController *settingsNav = [[UINavigationController alloc] initWithRootViewController:_settingsViewController];
        
        NSArray *viewControllers = @[homeNav, settingsNav];
        [self setViewControllers:viewControllers];
    }
    return self;
}

@end
