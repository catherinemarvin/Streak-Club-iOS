//
//  KHStreakSubmissionsService.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/24/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakSubmissionsService.h"

// API

#import "KHAPIService.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakSubmissionsService()

@property (nonatomic, strong) NSNumber *streakId;
@property (nonatomic, strong) id<KHStreakSubmissionsServiceDelegate>delegate;

@property (nonatomic, strong) KHAPIService *apiService;

@end

static NSString *const KHkSubmissionsUrl = @"streak/%@/submissions";

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
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    NSString *endPoint = [NSString stringWithFormat:KHkSubmissionsUrl, self.streakId];
    
    [self.apiService get:endPoint parameters:params success:^(id responseObject) {
        NSLog(@"Submissions: %@", responseObject);
    } failure:^(NSDictionary *errorDictionary, NSError *error) {
        NSLog(@"%@", error.debugDescription);
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