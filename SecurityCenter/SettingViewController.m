//
//  SettingViewController.m
//  SecurityCenter
//
//  Created by kt on 15/3/9.
//  Copyright (c) 2015年 kt. All rights reserved.
//

#import "SettingViewController.h"
#import "ShowCurrentDateView.h"
@interface SettingViewController ()

@end

@implementation SettingViewController {
    NSArray *dataArray;
    ShowCurrentDateView *showCurrentDateView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UITableView *tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    tab.delegate = self;
    tab.dataSource = self;
    [self.view addSubview:tab];
    
    showCurrentDateView = [[ShowCurrentDateView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
}

- (void)viewWillDisappear:(BOOL)animated {
    [showCurrentDateView stopUpdate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    dataArray = [[NSArray alloc]initWithObjects:@"校准时间",@"查看序列号",@"帮助",@"软件更新", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return dataArray.count/2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:21];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if(indexPath.row == 0) {
        [cell addSubview:showCurrentDateView];
    }
    
    cell.textLabel.text = [dataArray objectAtIndex:(2*indexPath.section)+indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
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
