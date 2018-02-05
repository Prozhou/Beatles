//
//  NoDisturbViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2018/1/24.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "NoDisturbViewController.h"

@interface NoDisturbViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *areaArray;
    NSArray *timeArray;
}

@end

@implementation NoDisturbViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    areaArray = @[@"家",@"公司"];
    timeArray = @[@"时段1",@"时段2"];
    [self.mainScrollView setContentSize:CGSizeMake(SCREENWIDTH *2, self.mainScrollView.frame.size.width)];
    self.areaTableView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    self.timeTableView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    self.automaticallyAdjustsScrollViewInsets = false;
}
-(UITableView *)areaTableView{
    if (!_areaTableView) {
        _areaTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _areaTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _areaTableView.tableFooterView = [UIView new];
        [_areaTableView registerNib:[UINib nibWithNibName:@"NoDisturbSwitchTableViewCell" bundle:nil] forCellReuseIdentifier:@"switchCell"];
        [_areaTableView registerNib:[UINib nibWithNibName:@"NoDistrubContentTableViewCell" bundle:nil] forCellReuseIdentifier:@"contentCell"];
        [_areaTableView registerNib:[UINib nibWithNibName:@"NoDistrubAddTableViewCell" bundle:nil] forCellReuseIdentifier:@"addCell"];
        [_areaTableView registerNib:[UINib nibWithNibName:@"NoDistrubHeaderFooterView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"headerFootViewCell"];
        _areaTableView.delegate = self;
        _areaTableView.dataSource = self;
        [_mainScrollView addSubview:_areaTableView];
        [_areaTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mainScrollView.mas_top);
            make.left.equalTo(self.mainScrollView.mas_left);
            make.width.equalTo(SCREENWIDTH);
            make.height.equalTo(self.mainScrollView);
        }];
    }
    return _areaTableView;
}
-(UITableView *)timeTableView{
    if (!_timeTableView) {
        _timeTableView = [[UITableView alloc]init];
        _timeTableView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
        _timeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _timeTableView.tableFooterView = [UIView new];
        [_timeTableView registerNib:[UINib nibWithNibName:@"NoDisturbSwitchTableViewCell" bundle:nil] forCellReuseIdentifier:@"switchCell"];
        [_timeTableView registerNib:[UINib nibWithNibName:@"NoDistrubContentTableViewCell" bundle:nil] forCellReuseIdentifier:@"contentCell"];
        [_timeTableView registerNib:[UINib nibWithNibName:@"NoDistrubAddTableViewCell" bundle:nil] forCellReuseIdentifier:@"addCell"];
        [_timeTableView registerNib:[UINib nibWithNibName:@"NoDistrubHeaderFooterView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"headerFootViewCell"];
        _timeTableView.delegate = self;
        _timeTableView.dataSource = self;
        [_mainScrollView addSubview:_timeTableView];
        [_timeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mainScrollView.mas_top);
            make.left.equalTo(self.mainScrollView.mas_left).offset(SCREENWIDTH);
            make.width.equalTo(SCREENWIDTH);
            make.height.equalTo(self.mainScrollView);
        }];
    }
    return _timeTableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        if (tableView == self.areaTableView) {
            return areaArray.count;
        }else{
            return timeArray.count;
        }
    }else if (section == 2){
        return 1;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NoDistrubHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerFootViewCell"];
//    headerView.contentView.backgroundColor = [UIColor lightGrayColor];
    if(tableView == self.areaTableView){
        if (section == 1) {
            headerView.textLabel.text = @"位置勿扰区域";
        }
    }else{
        
    }
    return headerView;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    NoDistrubHeaderFooterView *footView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerFootViewCell"];
//    footView.contentView.backgroundColor = [UIColor lightGrayColor];
    if (tableView == self.areaTableView) {
        if (section == 0) {
            footView.textLabel.text = @"勿扰区域内，会关闭所有防丢提醒";
        }
    }else{
        
    }
    return footView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    if (tableView == self.areaTableView) {
        if (indexPath.section == 0) {
            NoDisturbSwitchTableViewCell *switchcell = [tableView dequeueReusableCellWithIdentifier:@"switchCell"];
            switchcell.titleLabel.text = @"勿扰区域";
            cell = switchcell;
        }else if(indexPath.section == 1){
            NoDistrubContentTableViewCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"contentCell"];
            contentCell.titleLabel.text = areaArray[indexPath.row];
            cell = contentCell;
        }
        else{
            NoDistrubAddTableViewCell *addCell = [tableView dequeueReusableCellWithIdentifier:@"addCell"];
            cell = addCell;
        }
    }else if(tableView == self.timeTableView){
        if (indexPath.section == 0) {
            NoDisturbSwitchTableViewCell *switchcell = [tableView dequeueReusableCellWithIdentifier:@"switchCell"];
            switchcell.titleLabel.text = @"勿扰时段";
            cell = switchcell;
        }else if(indexPath.section == 1){
            NoDistrubContentTableViewCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"contentCell"];
            contentCell.titleLabel.text = timeArray[indexPath.row];
            cell = contentCell;
        }
        else{
            NoDistrubAddTableViewCell *addCell = [tableView dequeueReusableCellWithIdentifier:@"addCell"];
            cell = addCell;
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (IBAction)segmentControlValueChanged:(UISegmentedControl *)sender {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
