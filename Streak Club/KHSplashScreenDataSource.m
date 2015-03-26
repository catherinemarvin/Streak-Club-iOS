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
        
        KHSplashScreenInfo *pageOne = [[KHSplashScreenInfo alloc] initWithDescriptionText:NSLocalizedString(@"Streak Club is a way to keep motivated.", nil) imagePath:@"splash_screen_page_one_background"];
        [screens addObject:pageOne];
        
        KHSplashScreenInfo *pageTwo = [[KHSplashScreenInfo alloc] initWithDescriptionText:NSLocalizedString(@"Organize or join creative streaks and improve yourself", nil) imagePath:@"splash_screen_page_two_background"];
        [screens addObject:pageTwo];
        
        _splashScreens = screens;
    }
    return _splashScreens;
}



@end
