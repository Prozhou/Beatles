//
//  BoardSettingViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2018/2/2.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "BoardSettingViewController.h"

@interface BoardSettingViewController ()<UIScrollViewDelegate>

@end

@implementation BoardSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self rectMainScrollView];
    [self rectTitleButton];
    [self.backBtn setBackgroundColor:[UIColor whiteColor]];
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
-(void)rectTitleButton{
    for (UIButton *titleButton in self.titleButtonArray) {
        [titleButton addTarget:self action:@selector(titleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)rectMainScrollView{
    self.mainScrollView.contentSize = CGSizeMake(SCREENWIDTH * 2, self.view.frame.size.width);
    AntiWolfViewController *antiVC = [[AntiWolfViewController alloc] init];
    [self addChildViewController:antiVC];
    [self.mainScrollView addSubview:antiVC.view];
    [antiVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(0);
        make.left.equalTo(0);
        make.height.equalTo(self.mainScrollView.frame.size.height);
        make.width.equalTo(SCREENWIDTH);
    }];
    
    SettingViewController *setVC = [[SettingViewController alloc] init];
    [self addChildViewController:setVC];
    [self.mainScrollView addSubview:setVC.view];
    [setVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(0);
        make.left.equalTo(self.mainScrollView).offset(SCREENWIDTH);
        make.height.equalTo(self.mainScrollView.frame.size.height);
        make.width.equalTo(SCREENWIDTH);
    }];
}
-(void)titleButtonClicked:(UIButton *)sender{
    for (UIButton *btn in self.titleButtonArray) {
        if (sender.tag == btn.tag) {
            [btn setTitleColor:KORANGE forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:KTEXTGRAY forState:UIControlStateNormal];
        }
    }
    [self.mainScrollView scrollRectToVisible:CGRectMake(SCREENWIDTH *sender.tag, 0, SCREENWIDTH, self.mainScrollView.frame.size.height) animated:YES];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    for (UIButton *btn in self.titleButtonArray) {
        if (btn.tag == scrollView.contentOffset.x/SCREENWIDTH) {
            [btn setTitleColor:KORANGE forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:KTEXTGRAY forState:UIControlStateNormal];
        }
    }
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
