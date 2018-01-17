//
//  MainViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/18.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "MainViewController.h"
#import "SettingView.h"

@interface MainViewController ()
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameBtnView.titleLabel.numberOfLines = 0;
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self.nameBtnView setTitle:@"自拍\n面板" forState:UIControlStateNormal];
    self.batteryBtnView.titleLabel.numberOfLines = 0;
    [self.batteryBtnView setTitle:@"电量\n80%" forState:UIControlStateNormal];
    self.boardSettingBtnView.titleLabel.numberOfLines = 0;
    [self.boardSettingBtnView setTitle:@"面板\n设置" forState:UIControlStateNormal];
    self.baseSettingBtnView.titleLabel.numberOfLines = 0;
    [self.baseSettingBtnView setTitle:@"基础\n设置" forState:UIControlStateNormal];
}

-(void)viewWillAppear:(BOOL)animated{
    
}

- (IBAction)boardSettingBtn:(UIButton *)sender {
    SettingViewController *setVC = [[SettingViewController alloc]init];
    [self.navigationController pushViewController:setVC animated:YES];
}

- (IBAction)baseSettingBtn:(UIButton *)sender {
    BaseSettingViewController *baseSetting = [[BaseSettingViewController alloc]init];
    [self.navigationController pushViewController:baseSetting animated:YES];
}

- (IBAction)storeBtn:(UIButton *)sender {
}

- (IBAction)kitBtn:(UIButton *)sender {
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
