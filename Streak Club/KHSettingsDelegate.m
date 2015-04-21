//
//  KHSettingsDelegate.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/20/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSettingsDelegate.h"

#import "KHSessionManager.h"

@implementation KHSettingsDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    switch (cell.tag) {
        case KHSettingsCellTypeLogout: {
            [[KHSessionManager sharedInstance] logout];
            break;
        }
        case KHSettingsCellTypeContact: {
            break;
        }
        case KHSettingsCellTypeUsername:
        default:
            [tableView deselectRowAtIndexPath:indexPath animated:NO];
            break;
    }
}

@end
