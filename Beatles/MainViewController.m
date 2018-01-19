//
//  MainViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/18.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "MainViewController.h"
#import "SettingView.h"

@interface MainViewController ()/*<UIGestureRecognizerDelegate>*/{
    int  curPicIndex;
}
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
    [self rectMainImageView];
    NSLog(@"test%d",-1%10);
}
-(void)rectMainImageView{
    self.mainImageView.userInteractionEnabled = true;
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.mainLeftView addGestureRecognizer:leftSwipe];
    [self.mainLeftView addGestureRecognizer:rightSwipe];
    
     /*
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanFrom:)];
    pan.delegate =self;
    [self.mainLeftView addGestureRecognizer:pan];
      */
    
}
-(void)handlePanFrom:(UIPanGestureRecognizer*)gesture{
//    NSLog(@"%lf",[gesture translationInView:self.mainImageView].x);
    int offset_x = (int)[gesture translationInView:self.mainLeftView].x;
    if (offset_x % 2 == 0) {
        int step_x = offset_x / 2;
        NSLog(@"step***%d",step_x);
        curPicIndex = (curPicIndex - step_x) % 24;
        if (curPicIndex<0) {
            curPicIndex = curPicIndex+24;
        }
        NSLog(@"--------*%d*-------",curPicIndex);
        NSLog(@"picname===%@",[NSString stringWithFormat:@"0_%d",curPicIndex]);
        
        [self.mainImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"0_%d",curPicIndex]]];
        [gesture setTranslation:CGPointMake(0, 0) inView:self.mainLeftView];
    }
}
-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)gesture{
    NSLog(@"%@",gesture);
//    gesture.direction
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
        self.mainImageView.image = [UIImage imageNamed:@"0_0"];
    }
    return imageArray;
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
