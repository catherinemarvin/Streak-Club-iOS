//
//  KHBrowseService.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/27/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHBrowseService.h"

// API Calls
#import "KHAPIService.h"

// Models
#import "KHBrowseStreaksModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHBrowseService()

@property (nonatomic, weak) id<KHBrowseServiceDelegate>delegate;
@property (nonatomic, strong) KHAPIService *apiService;

@end

static NSString *const KHkBrowseScreenUrl = @"streaks";

@implementation KHBrowseService

- (instancetype)initWithDelegate:(id<KHBrowseServiceDelegate>)delegate {
    NSParameterAssert(delegate);
    if (self = [super init]) {
        _delegate = delegate;
    }
    return self;
}

- (void)requestBrowse {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [self.apiService get:KHkBrowseScreenUrl parameters:params success:^(id responseObject) {
        NSLog(@"Browse Result");
        NSLog(@"%@", responseObject);
        NSError *error;
        KHBrowseStreaksModel *browseStreaks = [MTLJSONAdapter modelOfClass:[KHBrowseStreaksModel class] fromJSONDictionary:responseObject error:&error];
        [self.delegate browseStreaksReceived:browseStreaks];
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
