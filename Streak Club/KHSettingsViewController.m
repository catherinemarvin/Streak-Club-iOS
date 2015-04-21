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

static NSString *KHkSettingsCellIdentifier = @"KHkSettingsCellIdentifier";

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
    [self.tableView registerClass:[KHSettingsViewCell class] forCellReuseIdentifier:KHkSettingsCellIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataSource numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KHkSettingsCellIdentifier forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[KHSettingsViewCell class]]) {
        KHSettingsViewCell *settingCell = (KHSettingsViewCell *)cell;
        [self _configureCell:settingCell indexPath:indexPath];
    }
    return cell;
}

- (void)_configureCell:(KHSettingsViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    NSString *title = [self.dataSource titleForIndex:indexPath.row];
    cell.textLabel.text = title;
}

@end
