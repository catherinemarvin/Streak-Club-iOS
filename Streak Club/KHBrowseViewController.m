//
//  KHBrowseViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/27/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHBrowseViewController.h"

// Data Source
#import "KHBrowseDataSource.h"

// View Helper
#import <Masonry.h>

@interface KHBrowseViewController ()

@property (nonatomic, strong) KHBrowseDataSource *dataSource;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation KHBrowseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
