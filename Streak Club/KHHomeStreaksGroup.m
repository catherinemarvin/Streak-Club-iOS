//
//  KHHomeStreaksGroup.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/30/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHHomeStreaksGroup.h"

#import "KHStreakModel.h"


@implementation KHHomeStreaksGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"activeStreaks" : @"active",
             @"completedStreaks" :@"completed"
             };
}

+ (NSValueTransformer *)activeStreaksJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[KHStreakModel class]];
}

+ (NSValueTransformer *)completedStreaksJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[KHStreakModel class]];
}

@end
