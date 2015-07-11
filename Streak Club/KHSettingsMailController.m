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

static NSString *const KHkEmailRecipient = @"k3vinhwang@gmail.com";

@implementation KHSettingsMailController

- (instancetype)init {
    return [self initWithDelegate:nil];
}

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
    [mailController setToRecipients:@[KHkEmailRecipient]];
    [mailController setSubject:NSLocalizedString(@"Itch.io App Feedback", nil)];
    
    [self.delegate mailControllerCreated:mailController];
}


#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    if (result == MFMailComposeResultSent) {
        NSLog(@"Mail sent!");
    }
    
    [self.delegate dismissMailController];
}

@end
