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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
