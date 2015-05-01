//
//  KHHomeStreaksModel.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/30/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHHomeStreaksModel.h"

#import "KHHomeStreaksGroup.h"

@implementation KHHomeStreaksModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"hosted" : @"hostedStreaks",
             @"joined" : @"joinedStreaks"
             };
}

+ (NSValueTransformer *)hostedJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[KHHomeStreaksGroup class]];
}

+ (NSValueTransformer *)joinedJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[KHHomeStreaksGroup class]];
}

@end
