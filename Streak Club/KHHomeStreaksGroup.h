//
//  KHHomeStreaksGroup.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/30/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Mantle.h>

@interface KHHomeStreaksGroup : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSArray *activeStreaks;
@property (nonatomic, copy, readonly) NSArray *completedStreaks;

@end
