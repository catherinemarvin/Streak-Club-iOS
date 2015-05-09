//
//  KHHomeScreenDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/16/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHHomeScreenDataSource.h"

// Service
#import "KHHomeScreenService.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHHomeScreenDataSource()<KHHomeScreenServiceDelegate>

@property (nonatomic, weak) id<KHHomeScreenDataSourceDelegate>delegate;
@property (nonatomic, strong) KHHomeScreenService *service;

@end

@implementation KHHomeScreenDataSource

- (instancetype)initWithDelegate:(id<KHHomeScreenDataSourceDelegate>)delegate {
    NSParameterAssert(delegate);
    if (self = [super init]) {
        _delegate = delegate;
        _service = [[KHHomeScreenService alloc] initWithDelegate:self];
    }
    return self;
}

- (void)requestHomeScreen {
    [self.service requestHomePage];
}

#pragma mark - KHHomeScreenServiceDelegate

- (void)homeStreaksReceived:(KHHomeStreaksModel * __nonnull)streaks {
    [self.delegate homeStreaksReceived:streaks];
}

@end

NS_ASSUME_NONNULL_END
