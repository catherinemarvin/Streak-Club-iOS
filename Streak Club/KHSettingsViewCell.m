//
//  KHSettingsViewCell.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/14/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSettingsViewCell.h"

#import <Streak_Club-Swift.h>

@implementation KHSettingsViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.font = [UIFont regularWithSize:18.0f];
    }
    return self;
}

@end
