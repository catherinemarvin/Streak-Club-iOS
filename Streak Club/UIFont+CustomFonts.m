//
//  UIFont+CustomFonts.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/27/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "UIFont+CustomFonts.h"

static NSString *const KHkRegularFont = @"Dosis-Regular";
static NSString *const KhkBoldFont = @"Dosis-Bold";

@implementation UIFont (CustomFonts)

+ (UIFont *)regularWithSize:(CGFloat)size {
    return [UIFont fontWithName:KHkRegularFont size:size];
}

+ (UIFont *)boldWithSize:(CGFloat)size {
    return [UIFont fontWithName:KhkBoldFont size:size];
}


@end
