//
//  KHSettingsViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/8/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSettingsViewController.h"

// View
#import "KHSettingsViewCell.h"

// View Helper
#import <Masonry.h>

// Data Source
#import "KHSettingsDataSource.h"

// Delegate
#import "KHSettingsDelegate.h"

@interface KHSettingsViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) KHSettingsDataSource *dataSource;
@property (nonatomic, strong) KHSettingsDelegate *delegate;

@end

@implementation KHSettingsViewController

- (instancetype)init {
    if (self = [super init]) {
        _dataSource = [[KHSettingsDataSource alloc] init];
        _delegate = [[KHSettingsDelegate alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.tableView.delegate = self.delegate;
    self.tableView.dataSource = self.dataSource;
    [self.tableView registerClass:[KHSettingsViewCell class] forCellReuseIdentifier:KHkSettingsCellIdentifier];
}


@end
