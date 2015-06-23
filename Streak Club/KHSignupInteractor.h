//
//  KHSignupInteractor.h
//  Streak Club
//
//  Created by Kevin Hwang on 6/18/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHSignupInteractor : NSObject

- (void)actionTapped:(nullable NSString *)username password:(nullable NSString *)password repeatPassword:(nullable NSString *)repeatPassword email:(nullable NSString *)email;

@end

NS_ASSUME_NONNULL_END