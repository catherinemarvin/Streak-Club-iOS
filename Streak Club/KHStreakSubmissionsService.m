//
//  KHStreakSubmissionsService.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/24/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakSubmissionsService.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakSubmissionsService()

@property (nonatomic, strong) NSNumber *streakId;
@property (nonatomic, strong) id<KHStreakSubmissionsServiceDelegate>delegate;

@end

@implementation KHStreakSubmissionsService

- (instancetype)initWithStreakId:(nonnull NSNumber *)streakId delegate:(nonnull id<KHStreakSubmissionsServiceDelegate>)delegate {
    NSParameterAssert(streakId);
    NSParameterAssert(delegate);
    
    if (self = [super init]) {
        _streakId = streakId;
        _delegate = delegate;
    }
    return self;
}

- (void)requestSubmissions {
    
}

@end

NS_ASSUME_NONNULL_END