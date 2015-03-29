//
//  KHSignupOrLoginView.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/28/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSignupOrLoginView.h"

// View Helpers
#import <Masonry/Masonry.h>
#import "UIFont+CustomFonts.h"
#import "UIColor+HexString.h"

@implementation KHSignupOrLoginView

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"34a0f2"];
        
    }
    return self;
}

@end
