//
//  KHSignuporLoginViewModel.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/2/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHSignupOrLoginViewProtocol.h"

@interface KHSignuporLoginViewModel : NSObject

- (instancetype)initWithView:(id<KHSignupOrLoginViewProtocol>)view;

@end
