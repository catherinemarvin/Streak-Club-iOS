//
//  KHLoginManager.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/30/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHLoginManager.h"

@interface KHLoginManager()

@property (nonatomic, weak) id<KHLoginManagerDelegate>delegate;

@end

@implementation KHLoginManager

- (instancetype)initWithDelegate:(id<KHLoginManagerDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
    }
    return self;
}

@end
