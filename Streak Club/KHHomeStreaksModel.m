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
             @"hostedStreaks" : @"hosted",
             @"joinedStreaks" : @"joined"
             };
}

+ (NSValueTransformer *)hostedStreaksJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[KHHomeStreaksGroup class]];
}

+ (NSValueTransformer *)joinedStreaksJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[KHHomeStreaksGroup class]];
}

@end
