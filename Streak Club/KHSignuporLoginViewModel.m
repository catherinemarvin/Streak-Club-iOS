//
//  KHSignuporLoginViewModel.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/2/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSignuporLoginViewModel.h"

@interface KHSignuporLoginViewModel()

@property (nonatomic, weak) id<KHSignupOrLoginViewProtocol>view;

@end

@implementation KHSignuporLoginViewModel

- (instancetype)initWithView:(id<KHSignupOrLoginViewProtocol>)view {
    if (self = [super init]) {
        _view = view;
    }
    return self;
}

@end
