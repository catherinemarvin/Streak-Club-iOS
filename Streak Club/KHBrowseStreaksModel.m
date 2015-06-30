//
//  KHBrowseStreaksModel.m
//  Streak Club
//
//  Created by Kevin Hwang on 5/9/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHBrowseStreaksModel.h"

// Models
#import "KHStreakModel.h"

@implementation KHBrowseStreaksModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"streaks" : @"streaks"
             };
}

+ (NSValueTransformer *)streaksJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[KHStreakModel class]];
}

@end
