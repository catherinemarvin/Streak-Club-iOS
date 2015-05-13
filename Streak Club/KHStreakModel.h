//
//  KHStreakModel.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/15/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Mantle.h>

@class KHUserModel;

typedef NS_ENUM(NSInteger, KHStreakPublishStatus) {
    KHStreakPublishStatusPublished,
    KHStreakPublishStatusDraft
};

typedef NS_ENUM(NSInteger, KHStreakCategory) {
    KHStreakCategoryOther,
    KHStreakCategoryInteractive,
    KHStreakCategoryVisualArt
};

@interface KHStreakModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSDate *endDate;
@property (nonatomic, copy, readonly) KHUserModel *host;
@property (nonatomic, copy, readonly) NSNumber *hourOffset;
@property (nonatomic, copy, readonly) NSNumber *remoteId;
@property (nonatomic, assign, readonly) KHStreakPublishStatus publishStatus;
@property (nonatomic, copy, readonly) NSDate *startDate;
@property (nonatomic, assign, readonly) KHStreakCategory category;
@property (nonatomic, copy, readonly) NSString *title;

@end
