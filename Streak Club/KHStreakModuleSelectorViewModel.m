//
//  KHStreakModuleSelectorViewModel.m
//  Streak Club
//
//  Created by Kevin Hwang on 8/8/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakModuleSelectorViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakModuleSelectorViewModel()

@property (nonatomic, assign) KHStreakModule activeModule;
@property (nonatomic, strong, readwrite) NSString *activeModuleTitle;

@end

@implementation KHStreakModuleSelectorViewModel

- (instancetype)initWithActiveStreakModule:(KHStreakModule)module {
    if (self = [super init]) {
        _activeModule = module;
    }
    return self;
}

- (NSString *)activeModuleTitle {
    if (!_activeModuleTitle) {
        _activeModuleTitle = [self _stringForModule:self.activeModule];
    }
    return _activeModuleTitle;
}

- (NSString *)_stringForModule:(KHStreakModule)module {
    NSString *title;
    switch (module) {
        case KHStreakModuleOverview: {
            title = NSLocalizedString(@"Overview", @"Overview of a streak.");
            break;
        }
        case KHStreakModuleParticipants: {
            title = NSLocalizedString(@"Participants", @"Participants who joined a streak.");
            break;
        }
        case KHStreakModuleTopStreaks: {
            title = NSLocalizedString(@"Top Streaks", @"List of the top streaks.");
            break;
        }
        case KHStreakModuleTopSubmissions: {
            title = NSLocalizedString(@"Top Submissions", @"List of the top submissions");
            break;
        }
        case KHStreakModuleTopStats: {
            title = NSLocalizedString(@"Top Stats", @"List of statistics");
            break;
        }
    }
    NSAssert(title.length > 0, @"There must be a title");
    return title;
}

@end

NS_ASSUME_NONNULL_END