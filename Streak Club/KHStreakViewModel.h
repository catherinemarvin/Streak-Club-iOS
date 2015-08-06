//
//  KHStreakViewModel.h
//  Streak Club
//
//  Created by Kevin Hwang on 8/4/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KHStreakTitleViewModel;

/**
 @brief Top level streak screen ViewModel;
 */
@interface KHStreakViewModel : NSObject

/**
 @brief The title of the view
 */
@property (nonatomic, copy, readonly) NSString *title;

@property (nonatomic, strong, readonly) KHStreakTitleViewModel *titleViewModel;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithTitle:(NSString *)title titleVM:(KHStreakTitleViewModel *)titleVM;

@end
