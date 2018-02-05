//
//  MainViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/18.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "MainViewController.h"
#import "SettingView.h"

@interface MainViewController (){
    int  curPicIndex;
    PanelState panelState;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    curPicIndex=12;
    panelState = PanelStateBack;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.batteryBtnView.titleLabel.numberOfLines = 0;
    self.boardSettingBtnView.titleLabel.numberOfLines = 0;
    self.baseSettingBtnView.titleLabel.numberOfLines = 0;
    [self.boardSettingBtnView setTitle:@"防狼\n面板" forState:UIControlStateNormal];
    [self.baseSettingBtnView setTitle:@"基础\n设置" forState:UIControlStateNormal];
    [self rectMainImageView];
}
-(void)rectMainImageView{
    self.mainImageView.userInteractionEnabled = true;
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.mainLeftView addGestureRecognizer:leftSwipe];
    [self.mainLeftView addGestureRecognizer:rightSwipe];
}
-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)gesture{
    NSLog(@"%@",gesture);
    self.mainImageView.animationImages = [self makeannimationImagesWithDirection:gesture.direction];
    self.mainImageView.animationDuration = 0.5;
    self.mainImageView.animationRepeatCount = 1;
    [self.mainImageView startAnimating];
}
-(NSArray *)makeannimationImagesWithDirection:(UISwipeGestureRecognizerDirection)direction{
    NSMutableArray *imageArray = [[NSMutableArray alloc] init];
    if (curPicIndex == 0) {
        if (direction == UISwipeGestureRecognizerDirectionLeft) {
            for (int i = 0; i < 12; i++) {
                NSString *imageName = [NSString stringWithFormat:@"0_%d", i];
                UIImage *image = [UIImage imageNamed:imageName];
                [imageArray addObject:image];
            }
        }else{
            for (int i = 0; i > -12; i--) {
                NSString *imageName = [NSString stringWithFormat:@"0_%d", i<0?i+24:i];
                UIImage *image = [UIImage imageNamed:imageName];
                [imageArray addObject:image];
            }
        }
        curPicIndex=12;
        panelState = PanelStateFront;
        [self panelStateChanged];
        self.mainImageView.image = [UIImage imageNamed:@"0_12"];
    }else if(curPicIndex ==12){
        if (direction == UISwipeGestureRecognizerDirectionLeft) {
            for (int i = 12; i <23; i++) {
                NSString *imageName = [NSString stringWithFormat:@"0_%d", i];
                UIImage *image = [UIImage imageNamed:imageName];
                [imageArray addObject:image];
            }
            [imageArray addObject:[UIImage imageNamed:@"0_0"]];
        }else{
            for (int i = 12; i >0; i--) {
                NSString *imageName = [NSString stringWithFormat:@"0_%d", i];
                UIImage *image = [UIImage imageNamed:imageName];
                [imageArray addObject:image];
            }
        }
        curPicIndex = 0;
        panelState = PanelStateBack;
        [self panelStateChanged];
        self.mainImageView.image = [UIImage imageNamed:@"0_0"];
    }
    return imageArray;
}
-(void)panelStateChanged{
    [self.boardSettingBtnView setTitle:panelState==PanelStateFront?@"防狼\n面板":@"遥控\n面板" forState:UIControlStateNormal];
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = false;
}
- (IBAction)batteryButtonClicked:(UIButton *)sender {
    BatteryViewController *batteryVC = [[BatteryViewController alloc]init];
    [self.navigationController pushViewController:batteryVC animated:YES];
}

- (IBAction)boardSettingBtn:(UIButton *)sender {
    /*
    if(panelState == PanelStateFront){
        AntiWolfViewController *antiWolfVC = [[AntiWolfViewController alloc]init];
        [self.navigationController pushViewController:antiWolfVC animated:YES];
    }else{
        SettingViewController *settingVC = [[SettingViewController alloc]init];
        [self.navigationController pushViewController:settingVC animated:YES];
    }*/
    BoardSettingViewController *settingVC = [[BoardSettingViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (IBAction)baseSettingBtn:(UIButton *)sender {
    BaseSettingViewController *baseSetting = [[BaseSettingViewController alloc]init];
    [self.navigationController pushViewController:baseSetting animated:YES];
}

- (IBAction)storeBtn:(UIButton *)sender {
    MyCollectDeviceViewController *myCollectDeviceVC = [[MyCollectDeviceViewController alloc]init];
    [self.navigationController pushViewController:myCollectDeviceVC animated:YES];
}

- (IBAction)kitBtn:(UIButton *)sender {
    NothingViewController *nothingVC = [[NothingViewController alloc]init];
    [self.navigationController pushViewController:nothingVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
