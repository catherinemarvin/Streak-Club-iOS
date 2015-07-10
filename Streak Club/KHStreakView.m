//
//  KHStreakView.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/7/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakView.h"

// View Helper
#import <Masonry.h>

@interface KHStreakView()

@property (nonatomic, strong) UIView *headerView;

@end

@implementation KHStreakView

- (instancetype)init {
    if (self = [super init]) {
        [self _configureSubviews];
        [self _setupAutolayout];
    }
    return self;
}

- (void)_configureSubviews {
    [self addSubview:self.headerView];
}

- (void)_setupAutolayout {
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.trailing.equalTo(self);
    }];
}

#pragma mark - Lazy Instantiation

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] init];
    }
    return _headerView;
}


@end
