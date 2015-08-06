//
//  KHStreakView.m
//  Streak Club
//
//  Created by Kevin Hwang on 8/4/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakView.h"

// Modules
#import "KHStreakTitleView.h"

// ViewModel
#import "KHStreakViewModel.h"

// View Helper
#import <Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakView()

@property (nonatomic, strong) KHStreakTitleView *titleView;

@end

@implementation KHStreakView

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        [self _configureSubviews];
        [self _initializeAutolayout];
    }
    return self;
}

- (void)_configureSubviews {
    [self addSubview:self.titleView];
}

- (void)_initializeAutolayout {
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)configureWithViewModel:(nonnull KHStreakViewModel *)viewModel {
    [self.titleView configureWithViewModel:viewModel.titleViewModel];
}

#pragma mark - Lazy Instantiation

- (KHStreakTitleView *)titleView {
    if (!_titleView) {
        _titleView = [[KHStreakTitleView alloc] init];
    }
    return _titleView;
}

@end

NS_ASSUME_NONNULL_END
