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
#import "KHStreakModel.h"

@interface KHBrowseService()

@property (nonatomic, weak) id<KHBrowseServiceDelegate>delegate;
@property (nonatomic, strong) KHAPIService *apiService;

@end

static NSString *const KHkBrowseScreenUrl = @"streaks";

@implementation KHBrowseService

- (instancetype)initWithDelegate:(id<KHBrowseServiceDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
        _apiService = [[KHAPIService alloc] init];
    }
    return self;
}

- (void)requestBrowse {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [self.apiService get:KHkBrowseScreenUrl parameters:params success:^(id responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSDictionary *errorDictionary, NSError *error) {
        NSLog(@"%@", error.debugDescription);
    }];
}

@end
