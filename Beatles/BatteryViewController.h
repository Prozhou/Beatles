//
//  BatteryViewController.h
//  Beatles
//
//  Created by Zhou Chao on 2018/1/26.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BatteryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *bleStateBtnView;
@property (weak, nonatomic) IBOutlet UILabel *battetyLabel;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *itemLabelLabelArray;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIImageView *singleImageView;
@property(nonatomic,strong)UIButton *backButton;
@end
