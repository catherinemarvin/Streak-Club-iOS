//
//  KHStreakTitleViewModel.h
//  Streak Club
//
//  Created by Kevin Hwang on 8/4/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KHStreakModel;

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakTitleViewModel : NSObject

@property (nonatomic, copy, readonly) NSString *titleText;
@property (nonatomic, copy, readonly) NSString *shortDescriptionText;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithStreakModel:(KHStreakModel *)streakModel;

@end

NS_ASSUME_NONNULL_END