//
//  KHSettingsDataSource.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/14/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KHSettingsCellType) {
    KHSettingsCellTypeLogout = 0,
    KHSettingsCellTypeUsername,
    KHSettingsCellTypeContact,
    KHSettingsCellTypeCount
};

FOUNDATION_EXPORT NSString *KHkSettingsCellIdentifier;

@interface KHSettingsDataSource : NSObject<UITableViewDataSource>

@end
