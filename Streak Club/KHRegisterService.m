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

// API

static NSString *const KHkUsernameKey = @"username";
static NSString *const KHkPasswordKey = @"password";
static NSString *const KHkPasswordRepeatKey = @"password_repeat";
static NSString *const KHkEmailKey = @"email";

static NSString *const KHkRegisterUrl = @"register";

static NSString *const KHkSessionKeyKey = @"key";
static NSString *const KHkErrorsKey = @"errors";

// Error

static NSString *const KhkRegisterErrorDomain = @"register";

@implementation KHRegisterService

- (instancetype)initWithDelegate:(id<KHRegisterServiceDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
        _apiService = [[KHAPIService alloc] init];
    }
    return self;
}

- (void)registerWithUsername:(NSString *)username password:(NSString *)password repeatPassword:(NSString *)repeatPassword email:(NSString *)email {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:username forKey:KHkUsernameKey];
    [params setValue:password forKey:KHkPasswordKey];
    [params setValue:repeatPassword forKey:KHkPasswordRepeatKey];
    [params setValue:email forKey:KHkEmailKey];
    
    [self.apiService post:KHkRegisterUrl parameters:params success:^(id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *response = (NSDictionary *)responseObject;
            NSArray *errors = [response valueForKey:KHkErrorsKey];
            if (errors) {
                [self _handleErrors:errors];
                return;
            }
            NSString *key = [response valueForKey:KHkSessionKeyKey];
            [self.delegate registerSucceededWithKey:key];
        }
    } failure:^(NSDictionary *errorDictionary, NSError *error) {
        [self.delegate registerFailedWithError:error];
    }];
}

/**
 API gives out errors like this:
 [ "Error Reason 1", "Error Reason 2" ]
 */

- (void)_handleErrors:(NSArray *)errors {
    NSString *firstError = [errors firstObject];
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    
    [userInfo setValue:firstError forKey:NSLocalizedDescriptionKey];
    
    NSError *error = [NSError errorWithDomain:KhkRegisterErrorDomain code:200 userInfo:userInfo];
    [self.delegate registerFailedWithError:error];
}

@end
