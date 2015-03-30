//
//  KHRegisterService.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/29/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHRegisterService.h"

// API
#import "KHAPIService.h"

@interface KHRegisterService()

@property (nonatomic, weak) id<KHRegisterServiceDelegate>delegate;
@property (nonatomic, strong) KHAPIService *apiService;

@end

@implementation KHRegisterService

- (instancetype)initWithDelegate:(id<KHRegisterServiceDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
        _apiService = [[KHAPIService alloc] init];
    }
    return self;
}

@end
