//
//  KHHomeStreakCellViewModel.m
//  Streak Club
//
//  Created by Kevin Hwang on 5/5/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakCellViewModel.h"

// Models
#import "KHStreakModel.h"
#import "KHUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakCellViewModel()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *duration;
@property (nonatomic, assign) float progressPercentage;
@property (nonatomic, assign) BOOL draft;
@property (nonatomic, assign) NSInteger participants;
@property (nonatomic, assign) NSInteger submissions;

@end

@implementation KHStreakCellViewModel

- (void)configureWithStreak:(KHStreakModel *)streak {
    NSParameterAssert(streak);
    
    self.title = streak.title;
    self.author = [NSString stringWithFormat:@"by %@", streak.host.username];
    
    NSString *startDateString = [self _dateToString:streak.startDate];
    NSString *endDateString = [self _dateToString:streak.endDate];
    NSString *rateString = [self _rateString:streak.rate];
    self.duration = [NSString stringWithFormat:NSLocalizedString(@"%@ from %@ to %@", @"Example: from June 15th to June 20th"), rateString, startDateString, endDateString];
    
    float totalStreakLength = [self _daysBetweenDate:streak.startDate andDate:streak.endDate];
    float timeElapsed = [self _daysBetweenDate:streak.startDate andDate:[NSDate date]];
    self.progressPercentage = timeElapsed / totalStreakLength;
    
    self.draft = streak.publishStatus == KHStreakPublishStatusDraft;
    
    self.participants = [streak.usersCount integerValue];
    self.submissions = [streak.submissionsCount integerValue];
}

- (NSString *)_rateString:(KHStreakRate)rate {
    NSString *rateString;
    switch (rate) {
        case KHStreakRateDaily: {
            rateString = NSLocalizedString(@"Daily", @"Describes a streak that occurs every day");
            break;
        }
        case KHStreakRateWeekly: {
            rateString = NSLocalizedString(@"Weekly", @"Describes a streak that occurs every week");
            break;
        }
    }
    return rateString;
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
