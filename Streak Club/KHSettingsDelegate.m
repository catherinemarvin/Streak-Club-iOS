//
//  KHSettingsDelegate.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/20/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSettingsDelegate.h"

// Login/Logout
#import "KHSessionManager.h"

// Mail
#import "KHSettingsMailController.h"

@interface KHSettingsDelegate()<KHSettingsMailControllerDelegate>

@property (nonatomic, weak) UIViewController *rootVC;

@property (nonatomic, strong) KHSettingsMailController *mailController;

@end

@implementation KHSettingsDelegate

- (instancetype)init {
    return [self initWithRootVC:nil];
}

- (instancetype)initWithRootVC:(UIViewController *)vc {
    NSParameterAssert(vc);
    
    if (self = [super init]) {
        _rootVC = vc;
        _mailController = [[KHSettingsMailController alloc] initWithDelegate:self];
    }
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    switch (cell.tag) {
        case KHSettingsCellTypeLogout: {
            [[KHSessionManager sharedInstance] logout];
            break;
        }
        case KHSettingsCellTypeContact: {
            [self.mailController createMailController];
            break;
        }
        case KHSettingsCellTypeUsername:
        default: {
            break;
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - KHSettingsMailControllerDelegate

- (void)cannotSendMail {
    NSLog(@"Sorry cannot send mail.");
}

- (void)mailControllerCreated:(UIViewController *)mailController {
    [self.rootVC presentViewController:mailController animated:YES completion:nil];
}

- (void)dismissMailController {
    [self.rootVC dismissViewControllerAnimated:YES completion:nil];
}

@end
