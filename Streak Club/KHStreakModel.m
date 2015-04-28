//
//  KHStreakModel.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/15/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakModel.h"

@implementation KHStreakModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"endDate" : @"end_date",
             @"host" : @"host",
             @"hourOffset" : @"hour_offset",
             @"remoteId" : @"id",
             @"publishStatus" : @"publish_status",
             @"startDate" : @"start_date"
             };
}


@end
