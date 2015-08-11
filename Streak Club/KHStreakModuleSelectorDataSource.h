//
//  KHStreakModuleSelectorDataSource.h
//  Streak Club
//
//  Created by Kevin Hwang on 8/10/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KHStreakModuleSelectorViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakModuleSelectorDataSource : NSObject

- (KHStreakModuleSelectorViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END