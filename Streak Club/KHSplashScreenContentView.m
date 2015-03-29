//
//  KHSplashScreenContentView.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/27/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSplashScreenContentView.h"

// View Helpers
#import "UIColor+HexString.h"
#import "UIFont+CustomFonts.h"
#import <Masonry/Masonry.h>

@interface KHSplashScreenContentView()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIView *footer;
@property (nonatomic, strong) UILabel *descriptionLabel;

@end

@implementation KHSplashScreenContentView

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"34a0f2"];
        
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        
        _footer = [[UIView alloc] init];
        [self addSubview:_footer];
        
        _descriptionLabel = [[UILabel alloc] init];
        _descriptionLabel.font = [UIFont regularWithSize:16.0f];
        [_footer addSubview:_descriptionLabel];
        
        [self _initializeAutolayout];
    }
    return self;
}

- (void)_initializeAutolayout {
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_centerY);
    }];
    
    CGFloat footerHeight = 100.0f;
    [self.footer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.equalTo(self);
        make.height.mas_equalTo(footerHeight);
    }];
    
    [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.descriptionLabel.superview);
    }];
}

- (void)setDescriptionText:(NSString *)text {
    self.descriptionLabel.text = text;
}

- (void)setImagePath:(NSString *)imagePath {
    self.imageView.image = [UIImage imageNamed:imagePath];
}

@end
