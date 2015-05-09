//
//  KHBrowseDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/27/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHBrowseDataSource.h"

// Service
#import "KHBrowseService.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHBrowseDataSource()<KHBrowseServiceDelegate>

@property (nonatomic, weak) id<KHBrowseDataSourceDelegate>delegate;
@property (nonatomic, strong) KHBrowseService *service;

@end

@implementation KHBrowseDataSource

- (instancetype)initWithDelegate:(id<KHBrowseDataSourceDelegate>)delegate {
    NSParameterAssert(delegate);
    if (self = [super init]) {
        _delegate = delegate;
        _service = [[KHBrowseService alloc] initWithDelegate:self];
        
    }
    return self;
}

- (void)requestBrowseScreen {
    [self.service requestBrowse];
}

#pragma mark - KHBrowseServiceDelegate

- (void)browseStreaksReceived:(KHBrowseStreaksModel *)streaks {
    [self.delegate browseStreaksReceived:streaks];
}

@end

NS_ASSUME_NONNULL_END
