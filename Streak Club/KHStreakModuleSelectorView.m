//
//  KHStreakModuleSelectorView.m
//  Streak Club
//
//  Created by Kevin Hwang on 8/8/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakModuleSelectorView.h"

// ViewModel
#import "KHStreakModuleSelectorViewModel.h"

// Helper
#import <Masonry.h>
#import "UIFont+CustomFonts.h"
#import "UIColor+HexString.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakModuleSelectorView()

@property (nonatomic, strong) UILabel *selectedModuleLabel;

@end

@implementation KHStreakModuleSelectorView

- (instancetype)init {
    if (self = [super init]) {
        [self _configureSubviews];
        [self _initializeAutolayout];
    }
    return self;
}

- (void)_configureSubviews {
    [self addSubview:self.selectedModuleLabel];
}

- (void)_initializeAutolayout {
    [self.selectedModuleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)configureWithViewModel:(nonnull KHStreakModuleSelectorViewModel *)viewModel {
    NSParameterAssert(viewModel);
    self.selectedModuleLabel.text = viewModel.activeModuleTitle;
}

#pragma mark - Lazy Instantiation

- (UILabel *)selectedModuleLabel {
    if (!_selectedModuleLabel) {
        _selectedModuleLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont regularWithSize:14.0f];
            
            label;
        });
    }
    return _selectedModuleLabel;
}

@end

NS_ASSUME_NONNULL_END