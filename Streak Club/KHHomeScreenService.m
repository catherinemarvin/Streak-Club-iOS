//
//  KHHomeScreenService.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/8/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHHomeScreenService.h"

// API Calls
#import "KHAPIService.h"

// Models
#import "KHStreakModel.h"

@interface KHHomeScreenService()

@property (nonatomic, weak) id<KHHomeScreenServiceDelegate>delegate;
@property (nonatomic, strong) KHAPIService *apiService;

@end

static NSString *const KHkHomeScreenUrl = @"my-streaks";

@implementation KHHomeScreenService

- (instancetype)initWithDelegate:(id<KHHomeScreenServiceDelegate>)delegate {
    NSParameterAssert(delegate);
    if (self = [super init]) {
        _delegate = delegate;
        _apiService = [[KHAPIService alloc] init];
    }
    return self;
}

- (void)requestHomePage {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [self.apiService post:KHkHomeScreenUrl parameters:params success:^(id responseObject) {
        NSLog(@"%@", responseObject);
        [self.delegate homeStreaksReceived:responseObject];
    } failure:^(NSDictionary *errorDictionary, NSError *error) {
        NSLog(@"%@", error.debugDescription);
    }];
}

@end
