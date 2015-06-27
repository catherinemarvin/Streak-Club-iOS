//
//  KHHomeStreakHeaderView.m
//  Streak Club
//
//  Created by Kevin Hwang on 6/25/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHHomeStreakHeaderView.h"

#import "UIFont+CustomFonts.h"
#import <Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHHomeStreakHeaderView()

@property (nonatomic, strong) UILabel *titleLabel;

@end
@implementation KHHomeStreakHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [self _initializeAutolayout];
    }
    return self;
}

- (void)setTitle:(NSString * __nonnull)title {
    NSParameterAssert(title);
    
    self.titleLabel.text = title;
}

#pragma mark - Layout

- (void)_initializeAutolayout {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self).with.offset(20.0f);
    }];
}

#pragma mark - Lazy Instantiation

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont boldWithSize:24.0f];
            label;
        });
    }
    return _titleLabel;
}
@end

NS_ASSUME_NONNULL_END