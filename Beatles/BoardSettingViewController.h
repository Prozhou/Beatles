//
//  BoardSettingViewController.h
//  Beatles
//
//  Created by Zhou Chao on 2018/2/2.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoardSettingViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *titleButtonArray;

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property(nonatomic,strong)UIButton *backBtn;
@end
