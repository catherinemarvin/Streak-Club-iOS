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
#import "KHHomeStreaksModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHHomeScreenService()

@property (nonatomic, weak) id<KHHomeScreenServiceDelegate>delegate;
@property (nonatomic, strong) KHAPIService *apiService;

@end

static NSString *const KHkHomeScreenUrl = @"my-streaks";

@implementation KHHomeScreenService

- (instancetype)init {
    return [self initWithDelegate:nil];
}

- (instancetype)initWithDelegate:(id<KHHomeScreenServiceDelegate>)delegate {
    NSParameterAssert(delegate);
    if (self = [super init]) {
        _delegate = delegate;
    }
    return self;
}

- (void)requestHomePage {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [self.apiService post:KHkHomeScreenUrl parameters:params success:^(id responseObject) {
        NSLog(@"Home Result");
        NSLog(@"%@", responseObject);
        NSError *error;
        KHHomeStreaksModel *homeStreaks = [MTLJSONAdapter modelOfClass:[KHHomeStreaksModel class] fromJSONDictionary:responseObject error:&error];
        [self.delegate homeStreaksReceived:homeStreaks];
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
