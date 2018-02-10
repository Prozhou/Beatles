//
//  MineViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/19.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11.0, *)) {
        self.mainTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.view.backgroundColor = [UIColor whiteColor];
    self.mainTable.backgroundColor = [UIColor whiteColor];
    self.mainTable.separatorColor = KSEPGRAY;

}
-(UITableView *)mainTable{
    if (!_mainTable) {
        _mainTable = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainTable.tableFooterView = [UIView new];
        [self.view addSubview:_mainTable];
        [_mainTable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(self.view);
        }];
        _mainTable.backgroundColor = [UIColor blueColor];
        [_mainTable registerNib:[UINib nibWithNibName:@"MineHeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"headerCell"];
        [_mainTable registerNib:[UINib nibWithNibName:@"MineSecondTableViewCell" bundle:nil] forCellReuseIdentifier:@"secondCell"];
        
        [_mainTable registerNib:[UINib nibWithNibName:@"MineThreeBtnTableViewCell" bundle:nil] forCellReuseIdentifier:@"threeBtnCell"];
        
        [_mainTable registerNib:[UINib nibWithNibName:@"MineNormalTableViewCell" bundle:nil] forCellReuseIdentifier:@"normalCell"];
        
        _mainTable.delegate = self;
        _mainTable.dataSource = self;
        _mainTable.estimatedRowHeight = 0;
        _mainTable.estimatedSectionHeaderHeight = 0;
        _mainTable.estimatedSectionFooterHeight = 0;
    }
    return _mainTable;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 9;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            return 456.0/1334 * SCREENHEIGHT;
            break;
        case 1:
        case 3:
        case 4:
        case 5:
            return 50;
            break;
        case 2:
            return 10;
            break;
        default:
            return 50;
            break;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    switch (indexPath.row){
        case 0:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"headerCell"forIndexPath:indexPath];
        }
            break;
        case 1:
        {
            cell =[tableView dequeueReusableCellWithIdentifier:@"threeBtnCell" forIndexPath:indexPath];
            MineThreeBtnTableViewCell *threeBtnCell = (MineThreeBtnTableViewCell*)cell;
        }
            break;
        case 2:
        {
            cell  = [tableView dequeueReusableCellWithIdentifier:@"sepCell"];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sepCell"];
                cell.backgroundColor = [UIColor colorWithRed:232.0/255 green:232.0/255 blue:232.0/255 alpha:1];
                UIView *sepView = [[UIView alloc]initWithFrame:CGRectMake(0, 9.5, SCREENWIDTH, 0.5)];
                sepView.backgroundColor = [UIColor lightGrayColor];
                [cell addSubview:sepView];
            }
        }
            break;
        case 3:
        {
            NSMutableAttributedString *labelStr = [[NSMutableAttributedString alloc] initWithString:@"已获得标签  有新标签"];
            [labelStr addAttribute:NSFontAttributeName
                            value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:15]
                            range:NSMakeRange(7, 4)];
            [labelStr addAttribute:NSForegroundColorAttributeName
                             value:KORANGE
                             range:NSMakeRange(7, 4)];
            cell =[tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
            MineNormalTableViewCell *NormalCell = (MineNormalTableViewCell*)cell;
            NormalCell.titleLable.attributedText =labelStr;
            NormalCell.smallImageView.image = [UIImage imageNamed:@"已获标签"];
        }
            break;
        case 4:
        {
            cell =[tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
            MineNormalTableViewCell *NormalCell = (MineNormalTableViewCell*)cell;
            NormalCell.titleLable.text = @"我的特权";
            NormalCell.smallImageView.image = [UIImage imageNamed:@"特权标"];
        }
            break;
        case 5:
        {
            cell =[tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
            MineNormalTableViewCell *NormalCell = (MineNormalTableViewCell*)cell;
            NormalCell.titleLable.text = @"荣誉历史";
            NormalCell.smallImageView.image = [UIImage imageNamed:@"荣誉标"];
        }
            break;
        case 6:
        {
            NSMutableAttributedString *labelStr = [[NSMutableAttributedString alloc] initWithString:@"社区  有新消息"];
            [labelStr addAttribute:NSFontAttributeName
                             value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:15]
                             range:NSMakeRange(4, 4)];
            [labelStr addAttribute:NSForegroundColorAttributeName
                             value:KORANGE
                             range:NSMakeRange(4, 4)];
            
            cell =[tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
            MineNormalTableViewCell *NormalCell = (MineNormalTableViewCell*)cell;
            NormalCell.titleLable.attributedText = labelStr;
            NormalCell.smallImageView.image = [UIImage imageNamed:@"社区标"];
        }
            break;
        case 7:
        {
            cell =[tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
            MineNormalTableViewCell *NormalCell = (MineNormalTableViewCell*)cell;
            NormalCell.titleLable.text = @"售后网点";
            NormalCell.smallImageView.image = [UIImage imageNamed:@"售后网点"];
        }
            break;
        default:
        {
            cell =[tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
            MineNormalTableViewCell *NormalCell = (MineNormalTableViewCell*)cell;
            NormalCell.titleLable.text = @"关于";
            NormalCell.smallImageView.image = [UIImage imageNamed:@"关于标"];
        }
            break;
    }
    if (indexPath.row==0) {
        [cell setSeparatorInset:UIEdgeInsetsMake(-20, 0, 0, 0)];
    }else if (indexPath.row==2) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, SCREENWIDTH, 0, 0)];
    }else{
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 38, 0, 38)];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NothingViewController *noVC = [[NothingViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:noVC animated:YES];
    self.hidesBottomBarWhenPushed = false;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
