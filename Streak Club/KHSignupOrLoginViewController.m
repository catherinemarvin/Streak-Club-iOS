//
//  KHSignupOrLoginViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/28/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSignupOrLoginViewController.h"

// Views
#import "KHSignupOrLoginView.h"

// View Helpers
#import <Masonry.h>

@interface KHSignupOrLoginViewController ()

@property (nonatomic, strong) KHSignupOrLoginView *signupLoginView;

@end

@implementation KHSignupOrLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.signupLoginView = [[KHSignupOrLoginView alloc] init];
    [self.view addSubview:self.signupLoginView];
    
    [self.signupLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

@end
