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
    titleArray = @[@"防丢功能",@"遗失记录",@"勿扰区域/时段",@"断开提醒",@"省电",@"升级"];
    [_mainTableView setTableFooterView:[UIView new]];
    [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.backButton setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view from its nib.
}
-(UIButton *)backButton{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_backButton];
        //        [_backButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left).offset(38);
            make.top.equalTo(self.view.mas_top).offset(50);
            make.size.equalTo(CGSizeMake(45, 45));
        }];
        _backButton.layer.borderWidth = 0.5;
        _backButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _backButton.layer.shadowOpacity = 0.3f;
        _backButton.layer.shadowOffset = CGSizeMake(1, 1);
        _backButton.layer.shadowColor = [UIColor blackColor].CGColor;
        _backButton.transform = CGAffineTransformRotate(_backButton.transform, M_PI / 4);
        UIImageView *bgImgV = [[UIImageView alloc]init];
        [bgImgV setImage:[UIImage imageNamed:@"返回"]];
        [_backButton addSubview:bgImgV];
        [bgImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(20, 20));
            make.center.equalTo(_backButton.center);
            //            make.centerY.equalTo(_backButton.mas_centerY);
            //            make.centerX.equalTo(_backButton.mas_centerX).offset(-8);
        }];
        bgImgV.transform = CGAffineTransformRotate(bgImgV.transform, - M_PI / 4);
        [_backButton addTarget:self action:@selector(backToMain) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _backButton;
}
-(void)backToMain{
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell.tag != 10) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 10, cell.frame.size.width, cell.frame.size.height-10)];
        label.tag = 2;
        label.textColor = KBLUE;
        label.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:18];
        cell.tag = 10;
        
        UIImageView *rowImageView = [[UIImageView alloc]initWithFrame:CGRectMake(cell.frame.size.width - 50, 16, 4, 8)];
        [rowImageView setImage:[UIImage imageNamed:@"右角"]];
        [label addSubview:rowImageView];
        [cell addSubview:label];
        
        if (indexPath.row % 2 == 1) {
            cell.backgroundColor = [UIColor colorWithRed:247.0/255 green:252.0/255 blue:251.0/255 alpha:1];
        }else{
            cell.backgroundColor = [UIColor whiteColor];
        }
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        NoDisturbViewController *noDisturbVC = [[NoDisturbViewController alloc]init];
        [self.navigationController pushViewController:noDisturbVC animated:YES];
    }
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
