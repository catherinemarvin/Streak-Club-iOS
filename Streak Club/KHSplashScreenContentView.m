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
@property (nonatomic, strong) UILabel *headerLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;

@end

@implementation KHSplashScreenContentView

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"34a0f2"];
        
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        
        _footer = [[UIView alloc] init];
        _footer.backgroundColor = [UIColor whiteColor];
        [self addSubview:_footer];
        
        _headerLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont boldWithSize:20.0f];
            label.numberOfLines = 1;
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithHexString:@"666666"];
            label;
        });
        [_footer addSubview:_headerLabel];
        
        _descriptionLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont regularWithSize:16.0f];
            label.numberOfLines = 0;
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithHexString:@"333333"];
            label;
        });
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
    
    CGFloat sidePadding = 20.0f;
    
    [self.headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.footer);
        make.left.equalTo(self.footer).with.offset(sidePadding);
        make.right.equalTo(self.footer).with.offset(-sidePadding);
    }];
    
    [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.descriptionLabel.superview);
        make.left.and.right.equalTo(self.headerLabel);
    }];
}

- (void)setHeaderText:(NSString *)text {
    self.headerLabel.text = text;
}

- (void)setDescriptionText:(NSString *)text {
    self.descriptionLabel.text = text;
}

- (void)setImagePath:(NSString *)imagePath {
    self.imageView.image = [UIImage imageNamed:imagePath];
}

@end
