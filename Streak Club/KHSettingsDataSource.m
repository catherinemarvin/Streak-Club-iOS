//
//  KHSettingsDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/14/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSettingsDataSource.h"

// Views
#import "KHSettingsViewCell.h"

NSString *KHkSettingsCellIdentifier = @"KHkSettingsCellIdentifier";

@implementation KHSettingsDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return KHSettingsCellTypeCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KHkSettingsCellIdentifier forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[KHSettingsViewCell class]]) {
        KHSettingsViewCell *settingCell = (KHSettingsViewCell *)cell;
        [self _configureCell:settingCell indexPath:indexPath];
    }
    return cell;
}

- (void)_configureCell:(KHSettingsViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    NSString *title = [self _titleForIndex:indexPath.row];
    cell.tag = [self _cellTypeForIndex:indexPath.row];
    cell.textLabel.text = title;
}

- (NSString *)_titleForIndex:(NSInteger)index {
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

- (KHSettingsCellType)_cellTypeForIndex:(NSInteger)index {
    return index;
}


@end
