//
//  KHCountView.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/15/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHCountView.h"

#import <Masonry/Masonry.h>
#import "UIFont+CustomFonts.h"


NS_ASSUME_NONNULL_BEGIN

@interface KHCountView ()

@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation KHCountView

- (instancetype)init {
    if (self = [super init]) {
        [self _configureSubviews];
        [self _initializeAutolayout];
    }
    return self;
}

- (void)_configureSubviews {
    [self addSubview:self.countLabel];
    [self addSubview:self.textLabel];
}

- (void)_initializeAutolayout {
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.centerX.equalTo(self);
        make.left.and.right.equalTo(self);
        make.bottom.equalTo(self.textLabel.mas_top);
    }];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.height.equalTo(self.countLabel);
        make.bottom.equalTo(self);
        make.left.and.right.equalTo(self);
    }];
}

#pragma mark - Public Methods

- (void)setCount:(NSInteger)count {
    self.countLabel.text = [NSString stringWithFormat:@"%ld", (long)count];
}

- (void)setText:(NSString * __nonnull)text {
    NSParameterAssert(text);
    self.textLabel.text = text;
}

#pragma mark - Lazy Instantiation

- (UILabel *)countLabel {
    if (!_countLabel) {
        _countLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont regularWithSize:18];
            
            label;
        });
    }
    return _countLabel;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont regularWithSize:18];
            
            label;
        });
    }
    return _textLabel;
}
@end

NS_ASSUME_NONNULL_END