//
//  V2MarketDetailViewController.h
//  Beatles
//
//  Created by Zhou Chao on 2018/2/6.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface V2MarketDetailViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *titleButtonArray;

@property (weak, nonatomic) IBOutlet UITableView *proTableView;
@property(nonatomic,strong)UIButton *carButton;
@property(nonatomic,strong)UIButton *backBtn;
@end
