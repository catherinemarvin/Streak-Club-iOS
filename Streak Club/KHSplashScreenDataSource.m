//
//  KHSplashScreenDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/25/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSplashScreenDataSource.h"
#import "KHSplashScreenInfo.h"

@interface KHSplashScreenDataSource()

@property (nonatomic, strong) NSArray *splashScreens;

@end

@implementation KHSplashScreenDataSource

- (KHSplashScreenInfo *)viewInfoForIndex:(NSUInteger)index {
    if (index > self.splashScreens.count) {
        return nil;
    }
    return self.splashScreens[index];
}

- (NSUInteger)count {
    return self.splashScreens.count;
}

#pragma mark - Lazy Instantiation

- (NSArray *)splashScreens {
    if (!_splashScreens) {
        NSMutableArray *screens = [NSMutableArray array];
        
        KHSplashScreenInfo *pageOne = [[KHSplashScreenInfo alloc]
                                       initWithHeaderText:NSLocalizedString(@"Streaks?", nil)
                                       descriptionText:NSLocalizedString(@"A streak is a commitment to yourself to complete some activity every day or week to help improve yourself.", nil)
                                       imagePath:@"splash_screen_page_one"];
        [screens addObject:pageOne];
        
        KHSplashScreenInfo *pageTwo = [[KHSplashScreenInfo alloc]
                                       initWithHeaderText:NSLocalizedString(@"How it works", nil)
                                       descriptionText:NSLocalizedString(@"Pick start and end dates, write some rules, then invite some friends (or do it solo).", nil)
                                       imagePath:@"splash_screen_page_two"];
        [screens addObject:pageTwo];
        
        _splashScreens = screens;
    }
    return _splashScreens;
}



@end
