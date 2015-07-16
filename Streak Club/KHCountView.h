//
//  KHCountView.h
//  Streak Club
//
//  Created by Kevin Hwang on 7/15/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 @brief Displays an interface like "5 views", with the 5 above a centered "views"
 */

NS_ASSUME_NONNULL_BEGIN

@interface KHCountView : UIView

- (void)setCount:(NSInteger)count;
- (void)setText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END