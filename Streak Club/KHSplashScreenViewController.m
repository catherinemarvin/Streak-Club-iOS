//
//  KHSplashScreenViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 1/28/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSplashScreenViewController.h"

@interface KHSplashScreenViewController ()

@end

@implementation KHSplashScreenViewController

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)loadView {
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    view.backgroundColor = [UIColor greenColor];
    self.view = view;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
