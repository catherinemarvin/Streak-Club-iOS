//
//  KHStreakDataSource.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/9/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakDataSource.h"

// Models
#import "KHStreakViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakDataSource()

@property (nonatomic, strong) KHStreakModel *streak;
@property (nonatomic, strong) id<KHStreakDataSourceDelegate>delegate;

@end

@implementation KHStreakDataSource

- (instancetype)initWithStreak:(nonnull KHStreakModel *)streak delegate:(nonnull id<KHStreakDataSourceDelegate>)delegate {
    NSParameterAssert(streak);
    NSParameterAssert(delegate);
    
    if (self = [super init]) {
        _streak = streak;
        _delegate = delegate;
    }
    return self;
}

- (void)requestStreakViewModel {
    KHStreakViewModel *vm = [[KHStreakViewModel alloc] init];
    [vm configureWithStreak:self.streak];
    [self.delegate updateWithStreakViewModel:vm];
}

@end

NS_ASSUME_NONNULL_END