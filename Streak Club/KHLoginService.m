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

static NSString *const KHkUsernameKey = @"username";
static NSString *const KhkPasswordKey = @"password";

static NSString *const KhkLoginUrl = @"login";

static NSString *const KHkSessionKeyKey = @"key";
static NSString *const KHkErrorsKey = @"errors";

@implementation KHLoginService

- (instancetype)initWithDelegate:(id<KHLoginServiceDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
        _apiService = [[KHAPIService alloc] init];
    }
    return self;
}

- (void)loginWithUsername:(NSString *)username password:(NSString *)password {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:username forKey:KHkUsernameKey];
    [params setValue:password forKey:KhkPasswordKey];
    
    [self.apiService post:KhkLoginUrl parameters:params success:^(id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *response = (NSDictionary *)responseObject;
            NSArray *errors = [response valueForKey:KHkErrorsKey];
            if (errors) {
                [self _handleErrors:errors];
                return;
            }
            
            NSString *key = [response valueForKey:KHkSessionKeyKey];
            [self.delegate loginSucceededWithKey:key];
        }
    } failure:^(NSDictionary *errorDictionary, NSError *error) {
        // TODO: Catch error
        [self.delegate loginFailedWithError:error];
    }];
}

/** Right now the API gives errors like this:
 [ "Error reason 1", "Error reason 2" ]
 */
- (void)_handleErrors:(NSArray *)errors {
    // Only handle the first error for now.
    NSString *firstError = [errors firstObject];
    
    NSError *error;
    
    if ([firstError isEqualToString:@"Incorrect username or password"]) {
        error = [NSError errorWithDomain:@"login" code:200 userInfo:nil];
    } else {
        error = [NSError errorWithDomain:@"login" code:201 userInfo:nil];
    }
    [self.delegate loginFailedWithError:error];
}

@end
