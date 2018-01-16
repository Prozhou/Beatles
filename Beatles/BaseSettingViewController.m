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
    titleArray = @[@"蓝牙连接/断开",@"防丢功能",@"遗失记录",@"勿扰区域/时段",@"断开提醒",@"省电",@"升级"];
    [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    // Do any additional setup after loading the view from its nib.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell.tag != 10) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, cell.frame.size.width, cell.frame.size.height)];
        label.tag = 2;
        label.textColor = KBLUE;
        label.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:18];
        cell.tag = 10;
        
        UIImageView *rowImageView = [[UIImageView alloc]initWithFrame:CGRectMake(cell.frame.size.width - 50, 16, 4, 8)];
        [rowImageView setImage:[UIImage imageNamed:@"右角"]];
        [label addSubview:rowImageView];
//        [rowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.equalTo(CGSizeMake(4, 8));
//            make.right.equalTo(self.view).offset(-50);
//            make.centerY.equalTo(label);
//        }];
        
        [cell addSubview:label];
    }
    for (UIView *sub in cell.subviews) {
        if (sub.tag == 2) {
            UILabel *label = (UILabel *)sub;
            label.text = titleArray[indexPath.row];
            break;
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setSeparatorInset:UIEdgeInsetsMake(0, 35, 0, 35)];
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
