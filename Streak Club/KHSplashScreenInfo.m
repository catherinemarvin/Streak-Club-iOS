//
//  KHSplashScreenInfo.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/25/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSplashScreenInfo.h"

@interface KHSplashScreenInfo()

@property (nonatomic, strong) NSString *headerText;
@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong) NSString *imagePath;

@end

@implementation KHSplashScreenInfo

- (instancetype)initWithHeaderText:(NSString *)headerText descriptionText:(NSString *)descriptionText imagePath :(NSString *)imagePath {
    if (self = [super init]) {
        _headerText = headerText;
        _descriptionText = descriptionText;
        _imagePath = imagePath;
    }
    return self;
}

@end
