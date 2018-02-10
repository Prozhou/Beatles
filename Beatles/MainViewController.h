//
//  MainViewController.h
//  Beatles
//
//  Created by Zhou Chao on 2017/12/18.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  NS_ENUM(NSInteger,PanelState){
    PanelStateFront=0,
    PanelStateBack=1
};

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *mainLeftView;

@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;

@property (weak, nonatomic) IBOutlet UIView *signalView;
@property (weak, nonatomic) IBOutlet UIButton *batteryBtnView;
@property (weak, nonatomic) IBOutlet UIButton *nameBtnView;

@property (weak, nonatomic) IBOutlet UIButton *boardSettingBtnView;
@property (weak, nonatomic) IBOutlet UIButton *baseSettingBtnView;
@property (weak, nonatomic) IBOutlet UIButton *storeBtnView;

- (IBAction)batteryButtonClicked:(UIButton *)sender;

- (IBAction)boardSettingBtn:(UIButton *)sender;
- (IBAction)baseSettingBtn:(UIButton *)sender;
- (IBAction)storeBtn:(UIButton *)sender;

@end
