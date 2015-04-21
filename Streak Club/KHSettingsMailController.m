//
//  KHSettingsMailController.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/20/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSettingsMailController.h"
#import <MessageUI/MessageUI.h>

@interface KHSettingsMailController()<MFMailComposeViewControllerDelegate>

@property (nonatomic, weak) id<KHSettingsMailControllerDelegate>delegate;

@end

@implementation KHSettingsMailController

- (instancetype)initWithDelegate:(id<KHSettingsMailControllerDelegate>)delegate {
    NSParameterAssert(delegate);
    
    if (self = [super init]) {
        _delegate = delegate;
    }
    return self;
}

- (void)createMailController {
    
    if (![MFMailComposeViewController canSendMail]) {
        [self.delegate cannotSendMail];
    }
    
    MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
    mailController.mailComposeDelegate = self;
    [mailController setToRecipients:@[@"k3vinhwang@gmail.com"]];
    [mailController setSubject:NSLocalizedString(@"Itch.io App Feedback", nil)];
    
    [self.delegate mailControllerCreated:mailController];
}

@end
