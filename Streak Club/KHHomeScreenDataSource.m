//
//  KHHomeScreenDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/16/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHHomeScreenDataSource.h"

@interface KHHomeScreenDataSource()

@property (nonatomic, weak) id<KHHomeScreenDataSourceDelegate>delegate;

@end

@implementation KHHomeScreenDataSource

- (instancetype)initWithDelegate:(id<KHHomeScreenDataSourceDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
    }
    return self;
}

@end
