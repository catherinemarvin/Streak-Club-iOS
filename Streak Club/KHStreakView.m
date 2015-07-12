//
//  KHStreakView.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/7/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakView.h"

// ViewModel
#import "KHStreakViewModel.h"

// View Helper
#import <Masonry.h>
#import "UIFont+CustomFonts.h"
#import "UIColor+HexString.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakView()

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *shortDescriptionLabel;

@end

@implementation KHStreakView

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        [self _configureSubviews];
        [self _setupAutolayout];
    }
    return self;
}

- (void)_configureSubviews {
    [self addSubview:self.headerView];
    [self.headerView addSubview:self.titleLabel];
    [self.headerView addSubview:self.shortDescriptionLabel];
}

- (void)_setupAutolayout {
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.leading.and.trailing.equalTo(self);
        make.bottom.equalTo(self.shortDescriptionLabel);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.headerView);
        make.top.equalTo(self.headerView);
    }];
    
    [self.shortDescriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.leading.equalTo(self.titleLabel);
    }];
}

#pragma mark - Public Methods

- (void)configureWithStreakViewModel:(KHStreakViewModel *)viewModel {
    NSParameterAssert(viewModel);
    
    self.titleLabel.text = viewModel.title;
    self.shortDescriptionLabel.text = viewModel.shortDescription;
}

#pragma mark - Lazy Instantiation

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = ({
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
            view;
        });
    }
    return _headerView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont regularWithSize:24.f];
            label.textColor = [UIColor colorWithHexString:@"333333"];
            label;
        });
    }
    return _titleLabel;
}

- (UILabel *)shortDescriptionLabel {
    if (!_shortDescriptionLabel) {
        _shortDescriptionLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont regularWithSize:20.f];
            label.textColor = [UIColor colorWithHexString:@"333333"];
            label;
        });
    }
    return _shortDescriptionLabel;
}

#pragma mark - Styling

@end

NS_ASSUME_NONNULL_END
