//
//  KHSettingsDelegate.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/20/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KHSettingsDataSource.h" // For the ENUM

NS_ASSUME_NONNULL_BEGIN

@interface KHSettingsDelegate : NSObject<UITableViewDelegate>

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithRootVC:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END