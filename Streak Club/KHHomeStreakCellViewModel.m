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

NS_ASSUME_NONNULL_BEGIN

@interface KHHomeStreakCellViewModel()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *duration;
@property (nonatomic, strong) NSString *shortDescription;
@property (nonatomic, assign) float progressPercentage;

@end

@implementation KHHomeStreakCellViewModel

- (void)configureWithStreak:(KHStreakModel *)streak {
    NSParameterAssert(streak);
    
    self.title = streak.title;
    self.author = [NSString stringWithFormat:@"by %@", streak.host.username];
    
    NSString *startDateString = [self _dateToString:streak.startDate];
    NSString *endDateString = [self _dateToString:streak.endDate];
    self.duration = [NSString stringWithFormat:NSLocalizedString(@"from %@ to %@", @"Example: from June 15th to June 20th"), startDateString, endDateString];
    self.shortDescription = streak.shortDescription;
    
    float totalStreakLength = [self _daysBetweenDate:streak.startDate andDate:streak.endDate];
    float timeElapsed = [self _daysBetweenDate:streak.startDate andDate:[NSDate date]];
    self.progressPercentage = timeElapsed / totalStreakLength;
}

- (NSString *)_dateToString:(NSDate *)date {
    NSParameterAssert(date);
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    
    NSString *string = [dateFormatter stringFromDate:date];
    return string;
}

- (NSInteger)_daysBetweenDate:(NSDate *)fromDateTime andDate:(NSDate *)toDateTime {
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSCalendarUnitDay
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}

@end

NS_ASSUME_NONNULL_END
