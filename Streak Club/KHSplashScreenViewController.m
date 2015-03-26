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

// Views
#import <Masonry.h>

@interface KHSplashScreenViewController ()<UIScrollViewDelegate>

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
    [self _setupScrollView];
    [self _setupPageControl];
}

- (void)_setupScrollView {
    [self.view addSubview:self.scrollView];
    self.scrollView.frame = self.view.bounds;
    CGSize pageScrollViewSize = self.scrollView.frame.size;
    self.scrollView.contentSize = CGSizeMake(pageScrollViewSize.width * [self.dataSource count], pageScrollViewSize.height);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
}

- (void)_setupPageControl {
    [self.view addSubview:self.pageControl];
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = [self.dataSource count];
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor darkGrayColor];
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

@end
