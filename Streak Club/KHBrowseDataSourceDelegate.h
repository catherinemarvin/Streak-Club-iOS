//
//  KHBrowseDataSourceDelegate.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/27/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KHBrowseStreaksModel;

@protocol KHBrowseDataSourceDelegate <NSObject>

- (void)browseStreaksReceived:(KHBrowseStreaksModel *)browseStreaks;

@end
