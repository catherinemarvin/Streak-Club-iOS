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
#import "KHStreakModuleSelectorView.h"

// ViewModel
#import "KHStreakViewModel.h"

// View Helper
#import <Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakView()

@property (nonatomic, strong) KHStreakTitleView *titleView;
@property (nonatomic, strong) KHStreakModuleSelectorView *moduleSelectorView;

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
    [self addSubview:self.moduleSelectorView];
}

- (void)_initializeAutolayout {
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.equalTo(self);
    }];
    
    [self.moduleSelectorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self);
        make.top.equalTo(self.titleView.mas_bottom);
    }];
}

- (void)configureWithViewModel:(nonnull KHStreakViewModel *)viewModel {
    [self.titleView configureWithViewModel:viewModel.titleViewModel];
    [self.moduleSelectorView configureWithViewModel:viewModel.moduleSelectorViewModel];
}

#pragma mark - Lazy Instantiation

- (KHStreakTitleView *)titleView {
    if (!_titleView) {
        _titleView = [[KHStreakTitleView alloc] init];
    }
    return _titleView;
}

- (KHStreakModuleSelectorView *)moduleSelectorView {
    if (!_moduleSelectorView) {
        _moduleSelectorView = [[KHStreakModuleSelectorView alloc] init];
    }
    return _moduleSelectorView;
}

@end

NS_ASSUME_NONNULL_END
