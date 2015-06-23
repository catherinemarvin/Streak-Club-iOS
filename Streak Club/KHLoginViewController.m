//
//  KHLoginViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 6/18/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHLoginViewController.h"

// View
#import "KHLoginView.h"

// Interactor
#import "KHLoginInteractor.h"

// View Helper
#import <Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHLoginViewController ()

@property (nonatomic, strong) KHLoginView *loginView;

@end

@implementation KHLoginViewController

@synthesize splashScreenVC = _splashScreenVC;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loginView = [[KHLoginView alloc] init];
    [self.view addSubview:self.loginView];
    
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

@end

NS_ASSUME_NONNULL_END
