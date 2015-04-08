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

@interface KHHomeScreenService()

@property (nonatomic, weak) id<KHHomeScreenServiceDelegate>delegate;
@property (nonatomic, strong) KHAPIService *apiService;

@end

@implementation KHHomeScreenService

- (instancetype)initWithDelegate:(id<KHHomeScreenServiceDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
        _apiService = [[KHAPIService alloc] init];
    }
    return self;
}

@end
