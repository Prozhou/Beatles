//
//  MainViewController.h
//  Beatles
//
//  Created by Zhou Chao on 2017/12/18.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *nameBtnView;
@property (weak, nonatomic) IBOutlet UIButton *batteryBtnView;
@property (weak, nonatomic) IBOutlet UIButton *boardSettingBtnView;
@property (weak, nonatomic) IBOutlet UIButton *baseSettingBtnView;
@property (weak, nonatomic) IBOutlet UIButton *storeBtnView;
@property (weak, nonatomic) IBOutlet UIButton *kitBtnView;

- (IBAction)boardSettingBtn:(UIButton *)sender;
- (IBAction)baseSettingBtn:(UIButton *)sender;
- (IBAction)storeBtn:(UIButton *)sender;
- (IBAction)kitBtn:(UIButton *)sender;

@end
