//
//  BaseSettingViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2018/1/9.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "BaseSettingViewController.h"

@interface BaseSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *titleArray ;
}
@end

@implementation BaseSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    titleArray = @[@"蓝牙连接／断开",@"防丢功能",@"遗失记录",@"勿扰区域／时段",@"断开提醒",@"省电",@"升级"];
    [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    // Do any additional setup after loading the view from its nib.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = titleArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    CGRect labelRect = cell.textLabel.frame;
    cell.textLabel.frame = CGRectMake(50, 0, labelRect.size.width, labelRect.size.height);
    cell.textLabel.textColor = KBLUE;
    return cell;
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
