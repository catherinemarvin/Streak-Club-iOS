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

// View

// View Helper
#import <Masonry.h>
#import <Streak_Club-Swift.h>
#import "UIColor+HexString.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakCell()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *draftLabelContainer;
@property (nonatomic, strong) UILabel *draftLabel;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UILabel *durationLabel;

@property (nonatomic, strong) UIView *divider;

@property (nonatomic, strong) UIProgressView *progressView;

@property (nonatomic, strong) CountView *submissionsView;
@property (nonatomic, strong) CountView *participantsView;

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
    [self.contentView addSubview:self.draftLabelContainer];
    [self.draftLabelContainer addSubview:self.draftLabel];
    [self.contentView addSubview:self.authorLabel];
    [self.contentView addSubview:self.durationLabel];
    [self.contentView addSubview:self.divider];
    [self.contentView addSubview:self.submissionsView];
    [self.contentView addSubview:self.participantsView];
    [self.contentView addSubview:self.progressView];
}

- (void)_initializeAutolayout {
    CGFloat sidePadding = 20.0f;
    CGFloat verticalOffset = 10.0f;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(sidePadding);
        make.right.equalTo(self.draftLabel.mas_left).with.offset(-sidePadding);
        make.top.equalTo(self.contentView).with.offset(sidePadding);
    }];
    
    [self.draftLabelContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).with.offset(-sidePadding);
        make.top.equalTo(self.contentView).with.offset(sidePadding);
        make.height.equalTo(self.draftLabel);
        make.width.equalTo(self.draftLabel).with.offset(10);
    }];
    
    [self.draftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.draftLabelContainer);
    }];
    
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(sidePadding);
        make.right.equalTo(self.contentView).with.offset(-sidePadding);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(verticalOffset);
    }];
    
    [self.durationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.authorLabel);
        make.top.equalTo(self.authorLabel.mas_bottom).with.offset(verticalOffset);
    }];
    
    [self.divider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.contentView);
        make.top.equalTo(self.durationLabel.mas_bottom).with.offset(verticalOffset);
        make.height.mas_equalTo(1);
    }];
    
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.authorLabel);
        make.bottom.equalTo(self.mas_bottom).with.offset(-verticalOffset);
        make.top.greaterThanOrEqualTo(self.participantsView.mas_bottom);
    }];
    
    [self.participantsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.divider.mas_bottom).with.offset(verticalOffset);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.submissionsView.mas_left);
    }];
    
    [self.submissionsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.participantsView);
        make.right.equalTo(self.contentView);
        make.width.equalTo(self.participantsView);
    }];
}

- (void)configureWithViewModel:(KHStreakCellViewModel * __nonnull)viewModel {
    NSParameterAssert(viewModel);
    self.titleLabel.text = viewModel.title;
    self.authorLabel.text = viewModel.author;
    self.durationLabel.text = viewModel.duration;
    [self.progressView setProgress:viewModel.progressPercentage animated:NO];
    self.draftLabelContainer.hidden = !viewModel.draft;
    
    [self.participantsView update:viewModel.participants text:NSLocalizedString(@"Participants", nil)];
    [self.submissionsView update:viewModel.submissions text:NSLocalizedString(@"Submissions", nil)];
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

- (UIView *)draftLabelContainer {
    if (!_draftLabelContainer) {
        _draftLabelContainer = ({
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = [UIColor colorWithHexString:@"fe8182"];
            view.layer.cornerRadius = 3.0f;
            view.layer.masksToBounds = YES;
            view;
        });
    }
    return _draftLabelContainer;
}

- (UILabel *)draftLabel {
    if (!_draftLabel) {
        _draftLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont boldWithSize:14.0f];
            label.text = [NSLocalizedString(@"Draft", @"Label indicating that the current streak is an unpublished draft") uppercaseStringWithLocale:[NSLocale currentLocale]];
            label.textColor = [UIColor whiteColor];
            label.textAlignment = NSTextAlignmentCenter;
            label.layer.cornerRadius = 4.0f;
            label.layer.masksToBounds = YES;
            
            [label setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
            label;
        });
    }
    return _draftLabel;
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

- (CountView *)submissionsView {
    if (!_submissionsView) {
        _submissionsView = [[CountView alloc] init];
    }
    return _submissionsView;
}

- (CountView *)participantsView {
    if (!_participantsView) {
        _participantsView = [[CountView alloc] init];
    }
    return _participantsView;
}

@end

NS_ASSUME_NONNULL_END
