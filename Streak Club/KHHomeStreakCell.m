//
//  KHHomeStreakCell.m
//  Streak Club
//
//  Created by Kevin Hwang on 5/1/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHHomeStreakCell.h"

// ViewModel
#import "KHHomeStreakCellViewModel.h"

// View Helper
#import <Masonry.h>
#import "UIFont+CustomFonts.h"

@interface KHHomeStreakCell()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UILabel *durationLabel;

@property (nonatomic, strong) UIView *divider;

@property (nonatomic, strong) UILabel *participantsLabel;
@property (nonatomic, strong) UILabel *submissionsLabel;

@end

@implementation KHHomeStreakCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _titleLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label;
        });
        [self addSubview:_titleLabel];
        
        _authorLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label;
        });
        [self addSubview:_authorLabel];
        
        _durationLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label;
        });
        [self addSubview:_durationLabel];
        
        _divider = ({
            UIView *view = [[UIView alloc] init];
            view;
        });
        [self addSubview:_divider];
        
        _participantsLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label;
        });
        [self addSubview:_participantsLabel];
        
        _submissionsLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label;
        });
        [self addSubview:_submissionsLabel];
        
        [self _initializeAutolayout];
    }
    return self;
}

- (void)_initializeAutolayout {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)configureWithViewModel:(KHHomeStreakCellViewModel * __nonnull)viewModel {
    NSParameterAssert(viewModel);
    self.titleLabel.text = viewModel.title;
    self.authorLabel.text = viewModel.author;
    self.durationLabel.text = viewModel.duration;
    
    self.participantsLabel.text = viewModel.participants;
    self.submissionsLabel.text = viewModel.participants;
}

@end
