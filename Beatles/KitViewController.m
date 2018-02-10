//
//  KitViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2018/2/5.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "KitViewController.h"

@interface KitViewController ()<DHDragableCellTableViewDataSource,DHDragableCellTableViewDelegate,UIScrollViewDelegate>{
    NSArray *titleArray;
}

@end

@implementation KitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    titleArray = @[@"城市交通",@"户外骑行",@"门禁系统",@"国际旅行",@"户外骑行2",@"户外徒步",@"女性安全",@"野外露营"];
    self.mainScrollView.backgroundColor = [UIColor whiteColor];
    self.mainScrollView.contentSize = CGSizeMake(SCREENWIDTH *2, self.mainScrollView.frame.size.height);
    
    self.recommendTableView.backgroundColor = KCYAN;
//    self.myTableView.backgroundColor = KCYAN;
    [self rectTitleButton];
    [self addChildViewController:self.nothingVC];
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
-(UITableView *)recommendTableView{
    if (!_recommendTableView) {
        _recommendTableView  = [[DHDragableCellTableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, self.mainScrollView.frame.size.height) style:UITableViewStylePlain];
        _recommendTableView.delegate = self;
        _recommendTableView.dataSource = self;
        [self.mainScrollView addSubview:_recommendTableView];
        [_recommendTableView registerNib:[UINib nibWithNibName:@"RecommandKitTableViewCell" bundle:nil] forCellReuseIdentifier:@"recommendCell"];
//        [_recommendTableView setEditing:YES animated:YES];
    }
    return _recommendTableView;
}
//-(UITableView *)myTableView{
//    if (!_myTableView) {
//        _myTableView  = [[UITableView alloc]initWithFrame:CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, self.mainScrollView.frame.size.height) style:UITableViewStylePlain];
//        _myTableView.delegate = self;
//        _myTableView.dataSource = self;
//        [self.mainScrollView addSubview:_myTableView];
//        [_myTableView registerNib:[UINib nibWithNibName:@"RecommandKitTableViewCell" bundle:nil] forCellReuseIdentifier:@"recommendCell"];
//    }
//    return _myTableView;
//}
-(NothingViewController *)nothingVC{
    if (!_nothingVC) {
        _nothingVC = [[NothingViewController alloc]init];
        _nothingVC.backBtn.hidden = YES;
        _nothingVC.view.frame = CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, self.mainScrollView.frame.size.height);
        [self.mainScrollView addSubview:_nothingVC.view];
    }
    return _nothingVC;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160*SCREENWIDTH/375.0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RecommandKitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recommendCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.titleLabel.text = titleArray[indexPath.row];
    [cell.mainImageView setImage:[UIImage imageNamed:titleArray[indexPath.row]]];
    return cell;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NothingViewController *noVC = [[NothingViewController alloc]init];
    noVC.nothingType = NothingType2;
//    self.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:noVC animated:YES];
//    self.hidesBottomBarWhenPushed = false;
    [self presentViewController:noVC animated:YES completion:nil];
}

- (NSArray *)dataSourceArrayInTableView:(DHDragableCellTableView *)tableView{
    return titleArray.copy;
}

- (void)tableView:(DHDragableCellTableView *)tableView newDataSourceArrayAfterMove:(NSArray *)newDataSourceArray{
    titleArray = newDataSourceArray.mutableCopy;
    [self.recommendTableView reloadData];
}

-(void)rectTitleButton{
    for (UIButton *titleButton in self.titleButtonArray) {
        [titleButton addTarget:self action:@selector(titleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)titleButtonClicked:(UIButton *)sender{
    for (UIButton *btn in self.titleButtonArray) {
        if (sender.tag == btn.tag) {
            [btn setTitleColor:KORANGE forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        }
    }
    [self.mainScrollView scrollRectToVisible:CGRectMake(SCREENWIDTH *sender.tag, 0, SCREENWIDTH, self.mainScrollView.frame.size.height) animated:YES];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    for (UIButton *btn in self.titleButtonArray) {
        if (btn.tag == scrollView.contentOffset.x/SCREENWIDTH) {
            [btn setTitleColor:KORANGE forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
