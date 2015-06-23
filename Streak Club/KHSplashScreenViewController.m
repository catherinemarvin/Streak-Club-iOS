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
#import "KHSplashScreenContentViewController.h"
#import "KHSignupViewController.h"
#import "KHLoginViewController.h"

// Protocols
#import "KHSplashScreenContent.h"

// View Helpers
#import <Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHSplashScreenViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) KHSplashScreenDataSource *dataSource;

// Views
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIViewController<KHSplashScreenContent> *signupOrLoginVC;

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
    [self _setupIntroScreens];
}

- (void)_setupScrollView {
    [self.view addSubview:self.scrollView];
    self.scrollView.frame = self.view.bounds;
    CGSize pageScrollViewSize = self.scrollView.frame.size;
    self.scrollView.contentSize = CGSizeMake(pageScrollViewSize.width * [self.dataSource count], pageScrollViewSize.height);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
}

- (void)_setupPageControl {
    [self.view addSubview:self.pageControl];
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = [self.dataSource count];
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor darkGrayColor];
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}

- (void)_setupIntroScreens {
    for (int i = 0; i < [self.dataSource count]; i++) {
        UIViewController *vc = [self _viewControllerAtIndex:i];
        [self addChildViewController:vc];
        CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
        CGFloat pageHeight = CGRectGetHeight(self.scrollView.frame);
        CGFloat xOffset = pageWidth * i;
        CGRect frame = CGRectMake(xOffset, 0, pageWidth, pageHeight);
        vc.view.frame = frame;
        [self.scrollView addSubview:vc.view];
        [vc didMoveToParentViewController:self];
    }
}

#pragma mark - Helper

/// @brief Creates and returns a new VC that corresponds to the view controller at position index in the carousel.
- (UIViewController *)_viewControllerAtIndex:(NSUInteger)index {
    if (index >= [self.dataSource count]) {
        return nil;
    }
    
    // The last screen is a special signup/login page.
    if (index == [self.dataSource count] - 1) {
        self.signupOrLoginVC = [[KHSignupViewController alloc] init];
        self.signupOrLoginVC.splashScreenVC = self;
        return self.signupOrLoginVC;
    }
    
    KHSplashScreenInfo *info = [self.dataSource viewInfoForIndex:index];
    
    KHSplashScreenContentViewController *vc = [[KHSplashScreenContentViewController alloc] init];
    [vc setHeaderText:info.headerText];
    [vc setImagePath:info.imagePath];
    [vc setDescriptionText:info.descriptionText];
    return vc;
}

- (void)toggleSignupOrLogin {
    Class nextClass;
    
    if ([self.signupOrLoginVC isKindOfClass:[KHSignupViewController class]]) {
        nextClass = [KHLoginViewController class];
    } else {
        nextClass = [KHSignupViewController class];
    }
    
    UIViewController<KHSplashScreenContent> *vc = [[nextClass alloc] init];
    
    [vc willMoveToParentViewController:self];
    [self addChildViewController:vc];
    [self.scrollView addSubview:vc.view];
    vc.view.frame = self.signupOrLoginVC.view.frame;
    vc.splashScreenVC = self;
    [vc didMoveToParentViewController:self];
    
    [self.signupOrLoginVC willMoveToParentViewController:nil];
    [self.signupOrLoginVC.view removeFromSuperview];
    [self.signupOrLoginVC removeFromParentViewController];
    self.signupOrLoginVC = vc;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
    float fractionalPage = self.scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.pageControl.currentPage = page;
}

@end

NS_ASSUME_NONNULL_END
