//
//  KHStreakProgressBar.m
//  Streak Club
//
//  Created by Kevin Hwang on 5/2/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakProgressBar.h"

// View Helpers
#import <Masonry/Masonry.h>
#import "UIColor+HexString.h"

@interface KHStreakProgressBar()

@property (nonatomic, strong) UIView *filledInView;

@property (nonatomic, assign) CGFloat completionPercentage;

@end

@implementation KHStreakProgressBar

- (instancetype)init {
    if (self = [super init]) {
        _filledInView = ({
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = [UIColor colorWithHexString:@"aada80"];
            view;
        });
        self.backgroundColor = [UIColor colorWithHexString:@"dadada"];
        [self _initializeAutolayout];
    }
    return self;
}

- (void)_initializeAutolayout {
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@20);
    }];
    [self.filledInView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.bottom.equalTo(self);
    }];
}

- (void)updateConstraints {
    [self.filledInView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self).multipliedBy(self.completionPercentage);
    }];
    [super updateConstraints];
}

- (void)setCompletionPercentage:(CGFloat)percentage {
    _completionPercentage = percentage;
    [self setNeedsUpdateConstraints];
}

@end
