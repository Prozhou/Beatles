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
        [_mainTable registerNib:[UINib nibWithNibName:@"MineNormalTableViewCell" bundle:nil] forCellReuseIdentifier:@"normalCell"];
        [_mainTable registerNib:[UINib nibWithNibName:@"MIneHelpTableViewCell" bundle:nil] forCellReuseIdentifier:@"helpCell"];
        _mainTable.delegate = self;
        _mainTable.dataSource = self;
        _mainTable.estimatedRowHeight = 0;
        _mainTable.estimatedSectionHeaderHeight = 0;
        _mainTable.estimatedSectionFooterHeight = 0;
    }
    return _mainTable;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            return 300.0/1334 * SCREENHEIGHT;
            break;
        case 1:
            return 260.0/1334* SCREENHEIGHT;
            break;
        case 2:
        case 4:
        case 5:
            return 50;
            break;
        case 3:
            return 15;
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
            cell =[tableView dequeueReusableCellWithIdentifier:@"secondCell" forIndexPath:indexPath];
        }
            break;
        case 2:
        {
            cell =[tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
            MineNormalTableViewCell *NormalCell = (MineNormalTableViewCell*)cell;
            NormalCell.titleLable.text = @"我的特权";
            
        }
            break;
        case 3:
        {
            cell  = [tableView dequeueReusableCellWithIdentifier:@"sepCell"];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sepCell"];
                cell.backgroundColor = [UIColor colorWithRed:247.0/255 green:252.0/255 blue:251.0/255 alpha:1];
            }
        }
            break;
        case 4:
        {
            cell =[tableView dequeueReusableCellWithIdentifier:@"helpCell" forIndexPath:indexPath];
        }
            break;
        case 5:
        {
            cell =[tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
            MineNormalTableViewCell *NormalCell = (MineNormalTableViewCell*)cell;
            NormalCell.titleLable.text = @"荣誉历史";
        }
            break;
        case 6:
        {
            cell =[tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
            MineNormalTableViewCell *NormalCell = (MineNormalTableViewCell*)cell;
            NormalCell.titleLable.text = @"社区";
        }
            break;
        default:
        {
            cell =[tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
            MineNormalTableViewCell *NormalCell = (MineNormalTableViewCell*)cell;
            NormalCell.titleLable.text = @"关于";
        }
            break;
    }
//    if (indexPath.row>4) {
//        [cell setSeparatorInset:UIEdgeInsetsMake(0, SCREENWIDTH, 0, 0)];
//    }else{
//        [cell setSeparatorInset:UIEdgeInsetsMake(0, 38, 0, 38)];
//    }
    [cell setSeparatorInset:UIEdgeInsetsMake(0, 38, 0, 38)];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
