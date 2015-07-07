//
//  KHHomeCollectionViewDataSource.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/27/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KHHomeView.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHHomeCollectionViewDataSource : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;

- (instancetype)initWithHomeView:(id<KHHomeView>)homeView NS_DESIGNATED_INITIALIZER;

- (void)refreshData;


@end

NS_ASSUME_NONNULL_END