//
//  KHSplashScreenContentViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/25/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSplashScreenContentViewController.h"

#import "UIColor+HexString.h"
#import <Masonry.h>

@interface KHSplashScreenContentViewController ()

@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UILabel *descriptionLabel;

@end

@implementation KHSplashScreenContentViewController

- (instancetype)init {
    if (self = [super init]) {
        _image = [[UIImageView alloc] init];
        _descriptionLabel = [[UILabel alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"34A0F2"];
    
    [self.view addSubview:self.image];
    
    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_centerY);
    }];
    
    [self.view addSubview:self.descriptionLabel];
    
    [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_centerY);
    }];
}

- (void)setDescriptionText:(NSString *)text {
    self.descriptionLabel.text = text;
}

- (void)setImagePath:(NSString *)imagePath {
    self.image.image = [UIImage imageNamed:imagePath];
}

@end
