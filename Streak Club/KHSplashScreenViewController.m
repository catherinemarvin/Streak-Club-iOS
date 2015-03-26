//
//  KHSplashScreenViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 1/28/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSplashScreenViewController.h"

// Data Source
#import "KHSplashScreenDataSource.h"

// Models
#import "KHSplashScreenInfo.h"

@interface KHSplashScreenViewController ()

@property (nonatomic, strong) KHSplashScreenDataSource *dataSource;

// Views
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation KHSplashScreenViewController

- (instancetype)init {
    if (self = [super init]) {
        _dataSource = [[KHSplashScreenDataSource alloc] init];
        _scrollView = [[UIScrollView alloc] init];
        _pageControl = [[UIPageControl alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
