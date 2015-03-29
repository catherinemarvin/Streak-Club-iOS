//
//  KHSplashScreenContentViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/25/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSplashScreenContentViewController.h"

// Views
#import "KHSplashScreenContentView.h"
#import "UIColor+HexString.h"
#import <Masonry.h>

@interface KHSplashScreenContentViewController ()

@property (nonatomic, strong) KHSplashScreenContentView *contentView;

@end

@implementation KHSplashScreenContentViewController

- (instancetype)init {
    if (self = [super init]) {
        _contentView = [[KHSplashScreenContentView alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.contentView];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)setHeaderText:(NSString *)headerText {
    [self.contentView setHeaderText:headerText];
}

- (void)setDescriptionText:(NSString *)text {
    [self.contentView setDescriptionText:text];
}

- (void)setImagePath:(NSString *)imagePath {
    [self.contentView setImagePath:imagePath];
}

@end
