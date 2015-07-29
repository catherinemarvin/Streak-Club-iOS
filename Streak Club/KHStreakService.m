//
//  KHStreakService.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/9/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakService.h"

// API
#import "KHAPIService.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakService()

@property (nonatomic, weak) id<KHStreakServiceDelegate>delegate;
@property (nonatomic, strong) KHAPIService *apiService;
@property (nonatomic, strong) NSNumber *remoteId;

@end

static NSString *const KHkStreakUrl = @"streak/%@";

@implementation KHStreakService

- (instancetype)init {
    return [self initWithRemoteId:nil delegate:nil];
}

- (instancetype)initWithRemoteId:(NSNumber *)remoteId delegate:(id<KHStreakServiceDelegate>)delegate {
    NSParameterAssert(remoteId);
    NSParameterAssert(delegate);
    if (self = [super init]) {
        _delegate = delegate;
        _remoteId = remoteId;
    }
    return self;
}

- (void)requestStreakInfo {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    NSString *endPoint = [NSString stringWithFormat:KHkStreakUrl, self.remoteId];
    
    [self.apiService get:endPoint parameters:params success:^(id responseObject) {
        NSLog(@"Response: %@", responseObject);
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