//
//  KHSplashScreenIntroViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 2/5/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSplashScreenIntroViewController.h"

@interface KHSplashScreenIntroViewController ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation KHSplashScreenIntroViewController

- (void)loadView {
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"Cool";
    
    [view addSubview:titleLabel];
    
    self.view = view;
}

@end
