//
//  KHSplashScreenInfo.h
//  Streak Club
//
//  Created by Kevin Hwang on 3/25/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KHSplashScreenInfo : NSObject

- (instancetype)initWithDescriptionText:(NSString *)descriptionText imagePath:(NSString *)imagePath NS_DESIGNATED_INITIALIZER;

@property (nonatomic, strong, readonly) NSString *descriptionText;
@property (nonatomic, strong, readonly) NSString *imagePath;

@end
