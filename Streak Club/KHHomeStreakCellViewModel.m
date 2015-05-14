//
//  KHHomeStreakCellViewModel.m
//  Streak Club
//
//  Created by Kevin Hwang on 5/5/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHHomeStreakCellViewModel.h"

// Models
#import "KHStreakModel.h"
#import "KHUserModel.h"

@interface KHHomeStreakCellViewModel()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *duration;
@property (nonatomic, strong) NSString *participants;
@property (nonatomic, strong) NSString *submissions;

@end

@implementation KHHomeStreakCellViewModel

- (void)configureWithStreak:(KHStreakModel *)streak {
    self.title = streak.title;
    self.author = streak.host.username;
    self.duration = [NSString stringWithFormat:NSLocalizedString(@"from %@ to %@", @"Example: from June 15th to June 20th"), streak.startDate, streak.endDate];
    self.participants = @"5 participants";
    self.submissions = @"20 submissions";
}

@end
