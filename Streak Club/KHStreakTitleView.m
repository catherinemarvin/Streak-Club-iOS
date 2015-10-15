//
//  KHStreakTitleView.m
//  Streak Club
//
//  Created by Kevin Hwang on 8/4/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakTitleView.h"

// ViewModel
#import "KHStreakTitleViewModel.h"

// View helpers
#import "UIColor+HexString.h"
#import <Streak_Club-Swift.h>
#import <Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakTitleView()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *shortDescriptionLabel;

@end

@implementation KHStreakTitleView

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
        
        [self _configureSubviews];
        [self _initializeAutolayout];
    }
    return self;
}

- (void)_configureSubviews {
    [self addSubview:self.titleLabel];
    [self addSubview:self.shortDescriptionLabel];
}

- (void)_initializeAutolayout {
    CGFloat margin = 20.0f;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(margin);
        make.top.equalTo(self);
    }];
    
    [self.shortDescriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(6.0f);
        make.bottom.equalTo(self);
    }];
}


- (void)configureWithViewModel:(nonnull KHStreakTitleViewModel *)viewModel {
    self.titleLabel.text = viewModel.titleText;
    self.shortDescriptionLabel.text = viewModel.shortDescriptionText;
}

#pragma mark - Lazy Instantiation

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont regularWithSize:18.0f];
            label;
        });
    }
    return _titleLabel;
}

- (UILabel *)shortDescriptionLabel {
    if (!_shortDescriptionLabel) {
        _shortDescriptionLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont regularWithSize:14.0f];
            label;
        });
    }
    return _shortDescriptionLabel;
}

@end

NS_ASSUME_NONNULL_END