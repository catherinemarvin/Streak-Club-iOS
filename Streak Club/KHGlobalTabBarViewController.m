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

typedef NS_ENUM(NSInteger, KHGlobalTabBarSection) {
    KHGlobalTabBarSectionHome
};

@interface KHGlobalTabBarViewController ()

@property (nonatomic, strong) KHHomeViewController *homeViewController;

@end

@implementation KHGlobalTabBarViewController

- (instancetype)init {
    if (self = [super init]) {
        _homeViewController = [[KHHomeViewController alloc] init];
        _homeViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"Home", nil) image:[UIImage imageNamed:@"homeTabIcon"] tag:KHGlobalTabBarSectionHome];
        UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:_homeViewController];
        
        NSArray *viewControllers = @[homeNav];
        [self setViewControllers:viewControllers];
    }
    return self;
}

@end
