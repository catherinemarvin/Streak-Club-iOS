//
//  KHJoinStreakService.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/29/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import "KHJoinStreakService.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHJoinStreakService()

@property (nonatomic, weak) id<KHJoinStreakServiceDelegate>delegate;

@end

@implementation KHJoinStreakService

- (instancetype)initWithDelegate:(nonnull id<KHJoinStreakServiceDelegate>)delegate {
    NSParameterAssert(delegate);
    if (self = [super init]) {
        _delegate = delegate;
    }
    return self;
}

- (void)joinStreakWithId:(NSNumber *)streakId {
    NSParameterAssert(streakId);
    
}

@end

NS_ASSUME_NONNULL_END