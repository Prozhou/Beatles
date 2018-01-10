//
//  BaseTabBarController.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/19.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController
//-(instancetype)init{
//    
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.backgroundImage = [Tools imageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]];
    
//    LoginViewController *mineVC = [[LoginViewController alloc]init];
    
    MainViewController *mainVC = [[MainViewController alloc]init];
//    mainVC.tabBarItem.title=@"设置";
    
    mainVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    
    mainVC.tabBarItem.image=[[UIImage imageNamed:@"主页标"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mainVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"主页标"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    MarketViewController *marketVC = [[MarketViewController alloc]init];
    //    mainVC.tabBarItem.title=@"商城";
    marketVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    marketVC.tabBarItem.image=[[UIImage imageNamed:@"商城标"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    marketVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"商城标"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    MineViewController *mineVC = [[MineViewController alloc]init];
    //    mainVC.tabBarItem.title=@"用户";
    mineVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    mineVC.tabBarItem.image=[[UIImage imageNamed:@"用户标"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mineVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"用户标"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *mainNav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    mainNav.navigationBar.hidden = YES;
    UINavigationController *marketNav = [[UINavigationController alloc]initWithRootViewController:marketVC];
    marketNav.navigationBar.hidden = YES;
    UINavigationController *mineNav = [[UINavigationController alloc]initWithRootViewController:mineVC];
    mineNav.navigationBar.hidden = YES;
    self.viewControllers = @[mainNav,marketNav,mineNav];
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
