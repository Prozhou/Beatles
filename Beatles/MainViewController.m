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
    self.storeBtnView.titleLabel.numberOfLines = 0;
    [self.boardSettingBtnView setTitle:@"面板\n设置" forState:UIControlStateNormal];
    [self.baseSettingBtnView setTitle:@"基础\n设置" forState:UIControlStateNormal];
    [self.storeBtnView setTitle:@"我的\n设备" forState:UIControlStateNormal];
    [self rectMainImageView];
    
    [self.batteryBtnView addTarget:self action:@selector(btnAnimation:) forControlEvents:UIControlEventTouchDown];
    
    
    
    /************************/
    //1.创建自定义的layer
    RectLayer *layer=[RectLayer layer];
    //2.设置layer的属性
    layer.backgroundColor= [UIColor clearColor].CGColor;
    layer.frame=self.signalView.frame;
    [layer setNeedsDisplay];
    //3.添加layer
    [self.signalView.layer addSublayer:layer];
    /************************/
    
}
-(void)btnAnimation:(UIButton *)sender{
//    NSLog(@"touchdown");
//    CABasicAnimation *scale = [CABasicAnimation animation];
//    scale.duration = .2;
//    scale.keyPath = @"transform.scale";
//    scale.toValue = @(0.8);
//    [sender.layer addAnimation:scale forKey:nil];
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animation];
    ani.keyPath = @"transform.scale";
    ani.values = @[@(0.8),@(1.0)];
    ani.duration = 0.3;
    [sender.layer addAnimation:ani forKey:nil];
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
    [self.nameBtnView setTitle:panelState==PanelStateFront?@"遥控":@"防狼" forState:UIControlStateNormal];
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = false;
}

- (IBAction)batteryButtonClicked:(UIButton *)sender {
    BatteryViewController *batteryVC = [[BatteryViewController alloc]init];
    SignalViewController *singleVC = [[SignalViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:singleVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
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
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:baseSetting animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (IBAction)storeBtn:(UIButton *)sender {
//    MyCollectDeviceViewController *myCollectDeviceVC = [[MyCollectDeviceViewController alloc]init];
    MyDeviceViewController *myDeviceVC = [[MyDeviceViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:myDeviceVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
