//
//  MyCollectDeviceViewController.h
//  Beatles
//
//  Created by Zhou Chao on 2018/1/25.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectDeviceViewController : UIViewController
@property(nonatomic,strong)UIButton *backButton;
@property (weak, nonatomic) IBOutlet UILabel *collectLevelLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;
- (IBAction)addButtonClicked:(UIButton *)sender;

@end
