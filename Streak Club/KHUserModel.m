//
//  KHUserModel.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/27/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHUserModel.h"

@implementation KHUserModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"remoteId" : @"id",
             @"username" : @"username",
             @"displayName" : @"display_name"
             };
}

@end
