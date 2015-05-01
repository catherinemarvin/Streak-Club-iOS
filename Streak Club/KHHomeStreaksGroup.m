//
//  KHHomeStreaksGroup.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/30/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHHomeStreaksGroup.h"


@implementation KHHomeStreaksGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"active": @"activeStreaks",
             @"completed" : @"completedStreaks"
             };
}

@end
