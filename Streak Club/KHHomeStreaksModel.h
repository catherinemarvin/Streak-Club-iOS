//
//  KHHomeStreaksModel.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/30/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Mantle.h>

@class KHHomeStreaksGroup;

@interface KHHomeStreaksModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy, readonly) KHHomeStreaksGroup *hostedStreaks;
@property (nonatomic, copy, readonly) KHHomeStreaksGroup *joinedStreaks;

@end
