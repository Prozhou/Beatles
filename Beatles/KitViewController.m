//
//  KitViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2018/2/5.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "KitViewController.h"

@interface KitViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@end

@implementation KitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainScrollView.backgroundColor = [UIColor redColor];
    self.mainScrollView.contentSize = CGSizeMake(SCREENWIDTH *2, self.mainScrollView.frame.size.height);
    
    self.recommendTableView.backgroundColor = KCYAN;
    self.myTableView.backgroundColor = KCYAN;
    [self rectTitleButton];
}
-(UITableView *)recommendTableView{
    if (!_recommendTableView) {
        _recommendTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, self.mainScrollView.frame.size.height) style:UITableViewStylePlain];
        _recommendTableView.delegate = self;
        _recommendTableView.dataSource = self;
        [self.mainScrollView addSubview:_recommendTableView];
        [_recommendTableView registerNib:[UINib nibWithNibName:@"RecommandKitTableViewCell" bundle:nil] forCellReuseIdentifier:@"recommendCell"];
    }
    return _recommendTableView;
}
-(UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView  = [[UITableView alloc]initWithFrame:CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, self.mainScrollView.frame.size.height) style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        [self.mainScrollView addSubview:_myTableView];
        [_myTableView registerNib:[UINib nibWithNibName:@"RecommandKitTableViewCell" bundle:nil] forCellReuseIdentifier:@"recommendCell"];
    }
    return _myTableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160*SCREENWIDTH/375.0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *titleArray = @[@"国际旅行",@"户外骑行",@"门禁系统"];
    RecommandKitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recommendCell" forIndexPath:indexPath];
    cell.titleLabel.text = titleArray[indexPath.row];
    [cell.mainImageView setImage:[UIImage imageNamed:titleArray[indexPath.row]]];
    return cell;
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
