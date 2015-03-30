//
//  KHAPIService.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/29/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHAPIService.h"

// Networking
#import <AFHTTPRequestOperationManager.h>

@interface KHAPIService()

@property (nonatomic, strong) NSString *baseUrl;
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

@end

static NSString *const KhkStreakClubBaseUrl = @"http://streak.club/api/1/";

@implementation KHAPIService

- (instancetype)init {
    if (self = [super init]) {
        _baseUrl = KhkStreakClubBaseUrl;
        
        NSURL *baseUrl = [NSURL URLWithString:KhkStreakClubBaseUrl];
        _manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseUrl];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}

- (void)get:(NSString *)url
 parameters:(NSDictionary *)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSDictionary *errorDictionary, NSError *error))failure {
    [self.manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:
    ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:operation.responseData options:0 error:&jsonError];
        
        failure(json, error);
    }];
}

- (void)post:(NSString *)url
  parameters:(NSDictionary *)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSDictionary *errorDictionary, NSError *error))failure {
    [self.manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:operation.responseData options:0 error:&jsonError];
        
        failure(json, error);
    }];
}

@end
