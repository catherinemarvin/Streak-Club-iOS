//
//  KHSettingsViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/8/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSettingsViewController.h"

// View Helper
#import <Masonry.h>

// Data Source
#import "KHSettingsDataSource.h"

@interface KHSettingsViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) KHSettingsDataSource *dataSource;

@end

@implementation KHSettingsViewController

- (instancetype)init {
    if (self = [super init]) {
        _dataSource = [[KHSettingsDataSource alloc] init];
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
    self.tableView.dataSource = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataSource numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource numberOfRowsInSection:section];
}

@end
