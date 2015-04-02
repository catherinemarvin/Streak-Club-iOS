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

static NSString *const KHkLoginErrorDomain = @"login";

typedef NS_ENUM(NSInteger, KHLoginError) {
    KHLoginErrorGenericError = 0,
    KHLoginErrorBadCredentials
};

static NSString *const KHkUsernameKey = @"username";
static NSString *const KHkPasswordKey = @"password";

static NSString *const KHkLoginUrl = @"login";

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
    [params setValue:password forKey:KHkPasswordKey];
    
    [self.apiService post:KHkLoginUrl parameters:params success:^(id responseObject) {
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
    
    NSString *localizedDescription;
    NSString *localizedFailureReason;
    NSString *localizedRecoverySuggestion;
    KHLoginError errorCode;
    
    if ([firstError isEqualToString:@"Incorrect username or password"]) {
        localizedDescription = NSLocalizedString(@"Login failed.", nil);
        localizedFailureReason = NSLocalizedString(@"Username or password was incorrect.", nil);
        localizedRecoverySuggestion = NSLocalizedString(@"Please double check your username and password.", nil);
    } else {
        localizedDescription = NSLocalizedString(@"Login failed.", nil);
        localizedFailureReason = NSLocalizedString(@"Something went wrong.", nil);
        localizedRecoverySuggestion = NSLocalizedString(@"Please try again.", nil);
    }
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    [dictionary setValue:localizedDescription forKey:NSLocalizedDescriptionKey];
    [dictionary setValue:localizedFailureReason forKey:NSLocalizedFailureReasonErrorKey];
    [dictionary setValue:localizedRecoverySuggestion forKey:NSLocalizedRecoverySuggestionErrorKey];
    
    NSError *error = [NSError errorWithDomain:KHkLoginErrorDomain code:errorCode userInfo:dictionary];
    [self.delegate loginFailedWithError:error];
}

@end
