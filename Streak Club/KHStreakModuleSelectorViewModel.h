//
//  KHStreakModuleSelectorViewModel.h
//  Streak Club
//
//  Created by Kevin Hwang on 8/8/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, KHStreakModule) {
    KHStreakModuleOverview,
    KHStreakModuleParticipants,
    KHStreakModuleTopStreaks,
    KHStreakModuleTopSubmissions,
    KHStreakModuleTopStats
};

@interface KHStreakModuleSelectorViewModel : NSObject

@property (nonatomic, strong, readonly) NSString *activeModuleTitle;

- (instancetype)initWithActiveStreakModule:(KHStreakModule)module;

@end

NS_ASSUME_NONNULL_END