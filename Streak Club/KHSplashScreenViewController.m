//
//  KHSplashScreenViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 1/28/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSplashScreenViewController.h"
#import "KHSplashScreenIntroViewController.h"
#import "KHSplashScreenSignUpViewController.h"

@interface KHSplashScreenViewController ()<UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, strong) KHSplashScreenIntroViewController *introScreen;
@property (nonatomic, strong) KHSplashScreenSignUpViewController *signupScreen;

@end

typedef NS_ENUM(NSInteger, KHSplashScreen) {
    KHSplashScreenIntro,
    KHSplashScreenSignup
};

@implementation KHSplashScreenViewController

- (instancetype)initWithTransitionStyle:(UIPageViewControllerTransitionStyle)style navigationOrientation:(UIPageViewControllerNavigationOrientation)navigationOrientation options:(NSDictionary *)options {
    if (self = [super initWithTransitionStyle:style navigationOrientation:navigationOrientation options:options]) {
        
    }
    return self;
}

#pragma mark - UIPageViewControllerDataSource

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return 2;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}

#pragma mark - UIPageViewControllerDelegate
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if ([viewController isEqual:self.introScreen]) {
        return nil;
    } else {
        return self.signupScreen;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if ([viewController isEqual:self.signupScreen]) {
        return nil;
    } else {
        return self.introScreen;
    }
}

@end
