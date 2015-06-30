//
//  KHHomeStreakCell.m
//  Streak Club
//
//  Created by Kevin Hwang on 5/1/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakCell.h"

// ViewModel
#import "KHStreakCellViewModel.h"

// View Helper
#import <Masonry.h>
#import "UIFont+CustomFonts.h"
#import "UIColor+HexString.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakCell()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UILabel *durationLabel;

@property (nonatomic, strong) UIView *divider;

@property (nonatomic, strong) UILabel *shortDescriptionLabel;
@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation KHStreakCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 1.0f;
        
        [self _configureSubviews];
        [self _initializeAutolayout];
    }
    return self;
}

- (void)_configureSubviews {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.authorLabel];
    [self.contentView addSubview:self.durationLabel];
    [self.contentView addSubview:self.divider];
    [self.contentView addSubview:self.shortDescriptionLabel];
    [self.contentView addSubview:self.progressView];
}

- (void)_initializeAutolayout {
    CGFloat sidePadding = 20.0f;
    CGFloat verticalOffset = 10.0f;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(sidePadding);
        make.right.equalTo(self.contentView).with.offset(-sidePadding);
        make.top.equalTo(self.contentView);
    }];
    
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(verticalOffset);
    }];
    
    [self.durationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.titleLabel);
        make.top.equalTo(self.authorLabel.mas_bottom).with.offset(verticalOffset);
    }];
    
    [self.divider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.contentView);
        make.top.equalTo(self.durationLabel.mas_bottom).with.offset(verticalOffset);
        make.height.mas_equalTo(1);
    }];
    
    [self.shortDescriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.titleLabel);
        make.top.equalTo(self.divider.mas_bottom).with.offset(verticalOffset);
    }];
    
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.titleLabel);
        make.top.equalTo(self.shortDescriptionLabel.mas_bottom).with.offset(verticalOffset);
    }];
}

- (void)configureWithViewModel:(KHStreakCellViewModel * __nonnull)viewModel {
    NSParameterAssert(viewModel);
    self.titleLabel.text = viewModel.title;
    self.authorLabel.text = viewModel.author;
    self.durationLabel.text = viewModel.duration;
    self.shortDescriptionLabel.text = viewModel.shortDescription;
    [self.progressView setProgress:viewModel.progressPercentage animated:NO];
}

#pragma mark - Lazy Instantiation

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont regularWithSize:22.0f];
            label;
        });
    }
    return _titleLabel;
}

- (UILabel *)authorLabel {
    if (!_authorLabel) {
        _authorLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont regularWithSize:16.0f];
            label;
        });
    }
    return _authorLabel;
}

- (UILabel *)durationLabel {
    if (!_durationLabel) {
        _durationLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont regularWithSize:14.0f];
            label;
        });
    }
    return _durationLabel;
}

- (UIView *)divider {
    if (!_divider) {
        _divider = ({
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = [UIColor colorWithHexString:@"dadada"];
            view;
        });
    }
    return _divider;
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

- (UIProgressView *)progressView {
    if (!_progressView) {
        _progressView = ({
            UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
            progressView.trackTintColor = [UIColor colorWithHexString:@"dadada"];
            progressView.progressTintColor = [UIColor colorWithHexString:@"aada80"];
            progressView;
        });
    }
    return _progressView;
}

@end

NS_ASSUME_NONNULL_END