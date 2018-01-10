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

}

-(void)viewWillAppear:(BOOL)animated{
    
}

- (IBAction)boardSettingBtn:(UIButton *)sender {
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
