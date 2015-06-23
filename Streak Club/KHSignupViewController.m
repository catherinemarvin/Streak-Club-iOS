//
//  KHSignupViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 6/18/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSignupViewController.h"

// View
#import "KHSignupView.h"

// Interactor
#import "KHSignupInteractor.h"

// View Helper
#import <Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHSignupViewController ()

@property (nonatomic, strong) KHSignupView *signupView;

@end

@implementation KHSignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.signupView = [[KHSignupView alloc] init];
    [self.view addSubview:self.signupView];
    
    [self.signupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

@end

NS_ASSUME_NONNULL_END
