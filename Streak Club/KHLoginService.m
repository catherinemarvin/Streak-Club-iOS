//
//  KHLoginService.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/29/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHLoginService.h"

// API Calls
#import "KHAPIService.h"

@interface KHLoginService()

@property (nonatomic, weak) id<KHLoginServiceDelegate>delegate;
@property (nonatomic, strong) KHAPIService *apiService;

@end

@implementation KHLoginService

- (instancetype)initWithDelegate:(id<KHLoginServiceDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
        _apiService = [[KHAPIService alloc] init];
    }
    return self;
}

@end
