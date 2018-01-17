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
    //UIImageView *bgImageV = [[UIImageView alloc]initWithFrame:self.view.frame];
    //[bgImageV setImage:[UIImage imageNamed:@"背景"]];
    //[self.view addSubview:bgImageV];
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
        _mainTable.delegate = self;
        _mainTable.dataSource = self;
        _mainTable.estimatedRowHeight = 0;
        _mainTable.estimatedSectionHeaderHeight = 0;
        _mainTable.estimatedSectionFooterHeight = 0;
    }
    return _mainTable;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            return 340.0/1334 * SCREENHEIGHT;
            break;
        case 1:
            return 320.0/1334* SCREENHEIGHT;
            break;
        case 2:
        case 3:
        case 4:
            return 40;
            break;
        case 5:
            return 50;
            break;
        default:
            return 20;
            break;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    NSArray *normalTitleArray = @[@"荣誉历史",@"守护",@"社区"];
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
            NormalCell.titleLable.text = normalTitleArray[indexPath.row -2];
        }
            break;
        case 3:
        {
            cell =[tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
            MineNormalTableViewCell *NormalCell = (MineNormalTableViewCell*)cell;
            NormalCell.titleLable.text = normalTitleArray[indexPath.row-2];
        }
            break;
        case 4:
        {
            cell =[tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
            MineNormalTableViewCell *NormalCell = (MineNormalTableViewCell*)cell;
            NormalCell.titleLable.text = normalTitleArray[indexPath.row-2];
        }
            break;
        case 5:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"textCell1"];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"textCell1"];
                UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(38, 20, 200,20)];
                textLabel.textColor = [UIColor colorWithRed:3/255.0 green:39/255.0 blue:141/255.0 alpha:1];
                textLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:18];
                [cell addSubview:textLabel];
                textLabel.text = @"关于我们";
            }
        }
            break;
        default:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"textCell"];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"textCell"];
                UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(38, 0, 200,20)];
                textLabel.textColor = [UIColor colorWithRed:3/255.0 green:39/255.0 blue:141/255.0 alpha:1];
                textLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:18];
                [cell addSubview:textLabel];
                textLabel.text = @"联系我们";
            }
        }
            break;
    }
    if (indexPath.row>4) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, SCREENWIDTH, 0, 0)];
    }else{
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 38, 0, 38)];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
