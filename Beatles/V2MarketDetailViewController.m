//
//  V2MarketDetailViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2018/2/6.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "V2MarketDetailViewController.h"

@interface V2MarketDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation V2MarketDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configProTableView];
    [self.backBtn setBackgroundColor:[UIColor whiteColor]];
    self.carButton.backgroundColor = [UIColor clearColor];
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
-(UIButton *)carButton{
    if (!_carButton) {
        _carButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIPanGestureRecognizer *pan =[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
        [_carButton addGestureRecognizer:pan];
        [_carButton setBackgroundImage:[UIImage imageNamed:@"购物车"] forState:UIControlStateNormal];
        [self.view addSubview:_carButton];
        [_carButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(50, 50));
            make.right.equalTo(self.view).offset(-30);
            make.centerY.equalTo(self.view);
        }];
        _carButton.layer.cornerRadius = 25.0f;
        _carButton.layer.shadowOpacity = 0.8f;
        _carButton.layer.shadowOffset = CGSizeMake(1, 1);
        _carButton.layer.shadowColor = [UIColor grayColor].CGColor;
    }
    return _carButton;
}
-(void)panAction:(UIPanGestureRecognizer *)pan
{
    //获取手势的位置
    CGPoint position =[pan translationInView:_carButton];
    //通过stransform 进行平移交换
    _carButton.transform = CGAffineTransformTranslate(_carButton.transform, position.x, position.y);
    //将增量置为零
    [pan setTranslation:CGPointZero inView:_carButton];
}
-(void)configProTableView{
    [self.proTableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"header"];
    [self.proTableView registerNib:[UINib nibWithNibName:@"V2MarketDetailTopTableViewCell" bundle:nil] forCellReuseIdentifier:@"topCell"];
    [self.proTableView registerNib:[UINib nibWithNibName:@"V2MarketDetailNameTableViewCell" bundle:nil] forCellReuseIdentifier:@"nameCell"];
    [self.proTableView registerNib:[UINib nibWithNibName:@"SelectColorTableViewCell" bundle:nil] forCellReuseIdentifier:@"selectColorCell"];
    [self.proTableView registerNib:[UINib nibWithNibName:@"AdressTableViewCell" bundle:nil] forCellReuseIdentifier:@"addressCell"];
    [self.proTableView registerNib:[UINib nibWithNibName:@"V2MarketDetailQuesTitleTableViewCell" bundle:nil] forCellReuseIdentifier:@"questionTitleCell"];
    [self.proTableView registerNib:[UINib nibWithNibName:@"V2MarketDetailAskTableViewCell" bundle:nil] forCellReuseIdentifier:@"askCell"];
    [self.proTableView registerNib:[UINib nibWithNibName:@"V2MarketDetailRecommendTableViewCell" bundle:nil] forCellReuseIdentifier:@"recommendCell"];
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }else if (section == 1){
        return 3;
    }
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView *header = nil;
    if (section != 0) {
        header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
        header.contentView.backgroundColor = KCYAN;
        UIView *topSep = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 0.5)];
        topSep.backgroundColor = KSEPGRAY;
        [header addSubview:topSep];
        
        UIView *bottomSep = [[UIView alloc]initWithFrame:CGRectMake(0, 4.5, SCREENWIDTH, 0.5)];
        bottomSep.backgroundColor = KSEPGRAY;
        [header addSubview:bottomSep];
    }
    return header;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = nil;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                V2MarketDetailTopTableViewCell *topCell = [tableView dequeueReusableCellWithIdentifier:@"topCell" forIndexPath:indexPath];
                
                [topCell rectScrollCellWith:@[@"游戏手柄附页1",@"游戏手柄附页2",@"游戏手柄附页3"]];
                cell = (UICollectionViewCell *)topCell;
            }
                break;
            case 1:
            {
                V2MarketDetailNameTableViewCell *nameCell = [tableView dequeueReusableCellWithIdentifier:@"nameCell" forIndexPath:indexPath];
                cell = (UICollectionViewCell *)nameCell;
            }
            case 2:
            {
                SelectColorTableViewCell *selectCell = [tableView dequeueReusableCellWithIdentifier:@"selectColorCell"];
                cell = (UICollectionViewCell *)selectCell;
            }
                break;
            default:
            {
                AdressTableViewCell *adressCell = [tableView dequeueReusableCellWithIdentifier:@"addressCell"];
                cell = (UICollectionViewCell *)adressCell;
            }
                break;
        }
    }else if (indexPath.section == 1){
        switch (indexPath.row) {
            case 0:
            {
                V2MarketDetailQuesTitleTableViewCell *questionTitleCell = [tableView dequeueReusableCellWithIdentifier:@"questionTitleCell"];
                cell = (UICollectionViewCell *)questionTitleCell;
            }
                break;
            case 1:
            {
                V2MarketDetailAskTableViewCell *askCell = [tableView dequeueReusableCellWithIdentifier:@"askCell"];
                cell = (UICollectionViewCell *)askCell;
            }
                break;
            default:{
                V2MarketDetailAskTableViewCell *askCell = [tableView dequeueReusableCellWithIdentifier:@"askCell"];
                cell = (UICollectionViewCell *)askCell;
            }
                break;
        }
    }else if (indexPath.section == 2){
        V2MarketDetailRecommendTableViewCell *recommendCell = [tableView dequeueReusableCellWithIdentifier:@"recommendCell"];
        NSArray *imageArray = @[@{@"pic":@"商城配件推荐1",@"name":@"自拍杆",@"price":@"¥99"},@{@"pic":@"商城配件推荐2",@"name":@"小剪刀",@"price":@"¥39"}];
        [recommendCell rectRecommendCellWith:imageArray];
        cell = (UICollectionViewCell*)recommendCell;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section != 0) {
        return 5.0;
    }
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                return SCREENWIDTH *530 /750;
            }
                break;
            case 1:
            {
                return 100;
            }
                break;
            case 2:
            {
                return 44;
            }
                break;
            default:{
                return 50;
            }
                break;
        }
    }else if (indexPath.section == 1){
        switch (indexPath.row) {
            case 0:
            {
                return 40;
            }
                break;
            case 1:
            {
                return 49.5;
            }
                break;
            default:{
                return 50;
            }
                break;
        }
    }else if (indexPath.section == 2){
        return 313;
    }
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
