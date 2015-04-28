//
//  KHBrowseDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/27/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHBrowseDataSource.h"

@interface KHBrowseDataSource()

@property (nonatomic, weak) id<KHBrowseDataSourceDelegate>delegate;

@end

@implementation KHBrowseDataSource

- (instancetype)initWithDelegate:(id<KHBrowseDataSourceDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
    }
    return self;
}

@end
