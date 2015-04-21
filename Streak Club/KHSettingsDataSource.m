//
//  KHSettingsDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/14/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSettingsDataSource.h"

@implementation KHSettingsDataSource

- (NSInteger)numberOfSections {
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return KHSettingsCellTypeCount;
}

- (NSString *)titleForIndex:(NSInteger)index {
    switch (index) {
        case KHSettingsCellTypeLogout: {
            return NSLocalizedString(@"Logout", nil);
            break;
        }
        case KHSettingsCellTypeUsername: {
            return NSLocalizedString(@"Username", nil);
            break;
        }
        case KHSettingsCellTypeContact: {
            return NSLocalizedString(@"Contact", nil);
            break;
        }
        default: {
            return NSLocalizedString(@"Unknown cell", nil);
            break;
        }
    }
}

@end
