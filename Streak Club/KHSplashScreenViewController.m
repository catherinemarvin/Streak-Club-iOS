//
//  KHSplashScreenViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 1/28/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSplashScreenViewController.h"

@interface KHSplashScreenViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation KHSplashScreenViewController

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)loadView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.scrollView.backgroundColor = [UIColor blueColor];
    self.scrollView.pagingEnabled = YES;
    
    self.view = self.scrollView;
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
