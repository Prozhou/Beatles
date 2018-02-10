//
//  SignalViewController.h
//  Beatles
//
//  Created by Zhou Chao on 2018/2/9.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignalViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *titleButtonArray;
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)NothingViewController *nothingVC;
@end
