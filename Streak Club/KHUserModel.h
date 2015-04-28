//
//  KHUserModel.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/27/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Mantle.h>

@interface KHUserModel : MTLModel

@property (nonatomic, copy, readonly) NSNumber *remoteId;
@property (nonatomic, copy, readonly) NSString *displayName;
@property (nonatomic, copy, readonly) NSString *username;


@end
