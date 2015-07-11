//
//  KHAPIService.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/29/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHAPIService.h"

// Key
#import "KHSessionManager.h"

// Networking
#import <AFHTTPRequestOperationManager.h>

@interface KHAPIService()

@property (nonatomic, strong) NSString *baseUrl;
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

@end

static NSString *const KhkStreakClubBaseUrl = @"https://streak.club/api/1/";
static NSString *const KHkSourceKey = @"source";
static NSString *const KhkSourceValue = @"ios";
static NSString *const KHkKeyKey = @"key";

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
    NSDictionary *params = [self _updatedParameters:parameters];
    
    [self.manager GET:url
           parameters:params
              success:^(AFHTTPRequestOperation *operation, id responseObject) {
                  success(responseObject);
    }
              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                  NSError *jsonError;
                  NSDictionary *json = [NSJSONSerialization JSONObjectWithData:operation.responseData options:0 error:&jsonError];
                  
                  failure(json, error);
              }];
}

- (void)post:(NSString *)url
  parameters:(NSDictionary *)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSDictionary *errorDictionary, NSError *error))failure {
    NSDictionary *params = [self _updatedParameters:parameters];
    
    [self.manager POST:url
            parameters:params
               success:^(AFHTTPRequestOperation *operation, id responseObject) {
                   success(responseObject);
    }
               failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                   NSError *jsonError;
                   NSDictionary *json = [NSJSONSerialization JSONObjectWithData:operation.responseData options:0 error:&jsonError];
                   
                   failure(json, error);
               }];
}

- (NSDictionary *)_updatedParameters:(NSDictionary *)dictionary {
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    [params setValue:KhkSourceValue forKey:KHkSourceKey];
    [params setValue:[KHSessionManager sharedInstance].key forKey:KHkKeyKey];
    return params;
}


@end
