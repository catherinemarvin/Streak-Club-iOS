//
//  KHJoinStreakService.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/29/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import "KHJoinStreakService.h"

// API
#import "KHAPIService.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHJoinStreakService()

@property (nonatomic, weak) id<KHJoinStreakServiceDelegate>delegate;
@property (nonatomic, strong) KHAPIService *apiService;

@end

static NSString *const KHkJoinStreakUrl = @"streak/%@/join";

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
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [self.apiService get:KHkJoinStreakUrl parameters:params success:^(id responseObject) {
        NSLog(@"Success: %@", responseObject);
    } failure:^(NSDictionary *errorDictionary, NSError *error) {
        NSLog(@"Failed to join a streak: %@", error);
    }];
}

#pragma mark - Lazy Instantiation

- (KHAPIService *)apiService {
    if (!_apiService) {
        _apiService = [[KHAPIService alloc] init];
    }
    return _apiService;
}

@end

NS_ASSUME_NONNULL_END