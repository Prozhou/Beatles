//
//  KitViewController.h
//  Beatles
//
//  Created by Zhou Chao on 2018/2/5.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KitViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *titleButtonArray;

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property(nonatomic,strong)UITableView *recommendTableView;
@property(nonatomic,strong)UITableView *myTableView;
@property(nonatomic,strong)NothingViewController *nothingVC;
@property(nonatomic,strong)UIButton *backBtn;
@end
