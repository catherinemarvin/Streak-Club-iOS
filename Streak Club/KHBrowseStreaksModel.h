//
//  KHBrowseStreaksModel.h
//  Streak Club
//
//  Created by Kevin Hwang on 5/9/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Mantle.h>

@interface KHBrowseStreaksModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSArray *streaks;

@end
