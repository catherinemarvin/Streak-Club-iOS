//
//  KHSplashScreenContentViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/25/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSplashScreenContentViewController.h"

#import <Masonry.h>

@interface KHSplashScreenContentViewController ()

@property (nonatomic, strong) UIImageView *backgroundImage;

@end

@implementation KHSplashScreenContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.backgroundImage = [[UIImageView alloc] init];
    [self.view addSubview:self.backgroundImage];
    
    [self.backgroundImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}

- (void)setImagePath:(NSString *)imagePath {
    self.backgroundImage.image = [UIImage imageNamed:imagePath];
}

@end
