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
    titleArray = @[@"防丢功能",@"遗失记录",@"勿扰区域/时段",@"断开提醒",@"省电",@"使用说明",@"升级  有新版本"];
    [_mainTableView setTableFooterView:[UIView new]];
    [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [_mainTableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"header"];
    [_mainTableView setSeparatorColor:KGREY];
    [self.backBtn setBackgroundColor:[UIColor whiteColor]];
    self.mainTableView.separatorColor = KSEPGRAY;
    // Do any additional setup after loading the view from its nib.
}
-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        _backBtn.layer.cornerRadius = 32;
        _backBtn.layer.borderWidth = 0.5;
        _backBtn.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3].CGColor;
        _backBtn.layer.shadowOpacity = 0.1f;
        _backBtn.layer.shadowOffset = CGSizeMake(0.5, 0.5);
        _backBtn.layer.shadowColor = [UIColor blackColor].CGColor;
        [_backBtn setBackgroundImage:[UIImage imageNamed:@"返回2"] forState:UIControlStateNormal];
        [self.view addSubview:_backBtn];
        [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(25);
            make.size.equalTo(CGSizeMake(102, 64));
            make.centerX.equalTo(self.view.mas_left);
        }];
    }
    return _backBtn;
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView *header =  [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    header.backgroundView = [UIView new];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(38, 34, 200, 26)];
    titleLabel.text = @"基础设置";
    titleLabel.font = KFONT(24);
    [header addSubview:titleLabel];
    return header;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UITableViewHeaderFooterView *footer =  [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    footer.backgroundView = [UIView new];
    UIView *sepLine = [[UIView alloc]initWithFrame:CGRectMake(38, 0, SCREENWIDTH - 76, 0.5)];
    sepLine.backgroundColor = KSEPGRAY;
    [footer.backgroundView addSubview:sepLine];
    return footer;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell.tag != 10) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 10, cell.frame.size.width, cell.frame.size.height-10)];
        label.tag = 2;
        label.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:18];
        cell.tag = 10;
        if(indexPath.row == 0 || indexPath.row == 4){
            UIImageView *rowImageView = [[UIImageView alloc]initWithFrame:CGRectMake(cell.frame.size.width - 50, 16, 9, 7)];
            [rowImageView setImage:[UIImage imageNamed:@"小钩"]];
            [label addSubview:rowImageView];
            [cell addSubview:label];
        }else{
            UIImageView *rowImageView = [[UIImageView alloc]initWithFrame:CGRectMake(cell.frame.size.width - 50, 16, 4, 8)];
            [rowImageView setImage:[UIImage imageNamed:@"右角"]];
            [label addSubview:rowImageView];
            [cell addSubview:label];
        }
        
    }
    for (UIView *sub in cell.subviews) {
        if (sub.tag == 2) {
            UILabel *label = (UILabel *)sub;
            label.text = titleArray[indexPath.row];
            break;
        }
    }
    
    if(indexPath.row == 6){
        for (UIView *sub in cell.subviews) {
            if (sub.tag == 2) {
                NSMutableAttributedString *versionStr = [[NSMutableAttributedString alloc] initWithString:titleArray[indexPath.row]];
                [versionStr addAttribute:NSFontAttributeName
                                value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:15]
                                range:NSMakeRange(4, 4)];
                [versionStr addAttribute:NSForegroundColorAttributeName
                                   value:KORANGE
                                   range:NSMakeRange(4, 4)];
                UILabel *label = (UILabel *)sub;
                label.attributedText = versionStr;
            }
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


@end
