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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.backgroundImage = [Tools imageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]];
//    self.tabBar.backgroundImage = [Tools imageWithColor:[UIColor redColor]];

    UIView *blackLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 0.5)];
    blackLineView.backgroundColor = [UIColor blackColor];
    [self.tabBar addSubview:blackLineView];
    
    UIView *alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, -8, SCREENWIDTH, 9)];
    alphaView.backgroundColor = RGBA(126, 126, 126, 0.2);
    [self.tabBar addSubview:alphaView];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"SourceHanSansCN-Normal" size:12.0f],NSFontAttributeName,nil] forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:KORANGE, NSForegroundColorAttributeName, [UIFont fontWithName:@"SourceHanSansCN-Normal" size:12.0f],NSFontAttributeName,nil] forState:UIControlStateSelected];
//    LoginViewController *mineVC = [[LoginViewController alloc]init];
    
    MainViewController *mainVC = [[MainViewController alloc]init];
    mainVC.tabBarItem.title=@"铁甲虫";
//    mainVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    mainVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    
    mainVC.tabBarItem.image=[[UIImage imageNamed:@"铁甲虫标"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mainVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"铁甲虫标点亮"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    KitViewController *kitVC = [[KitViewController alloc] init];
    kitVC.tabBarItem.title=@"智能套件";
    kitVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    kitVC.tabBarItem.image=[[UIImage imageNamed:@"智能套件"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    kitVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"智能套件标点亮"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    V2MarketViewController *marketVC = [[V2MarketViewController alloc]init];
    marketVC.tabBarItem.title=@"商城";
//    marketVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    marketVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    marketVC.tabBarItem.image=[[UIImage imageNamed:@"新商场标"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    marketVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"新商场标点亮"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    MineViewController *mineVC = [[MineViewController alloc]init];
    mineVC.tabBarItem.title=@"我的";
//    mineVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    mineVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    mineVC.tabBarItem.image=[[UIImage imageNamed:@"我的标"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mineVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"我的标点亮"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *mainNav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    mainNav.navigationBar.hidden = YES;
    UINavigationController *kitNav = [[UINavigationController alloc]initWithRootViewController:kitVC];
    kitNav.navigationBar.hidden = YES;
    UINavigationController *marketNav = [[UINavigationController alloc]initWithRootViewController:marketVC];
    marketNav.navigationBar.hidden = YES;
    UINavigationController *mineNav = [[UINavigationController alloc]initWithRootViewController:mineVC];
    mineNav.navigationBar.hidden = YES;
    self.viewControllers = @[mainNav,kitNav,marketNav,mineNav];
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
