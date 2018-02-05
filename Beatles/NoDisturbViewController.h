//
//  NoDisturbViewController.h
//  Beatles
//
//  Created by Zhou Chao on 2018/1/24.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoDisturbViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
- (IBAction)segmentControlValueChanged:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property(nonatomic,strong)UITableView *areaTableView;
@property(nonatomic,strong)UITableView *timeTableView;
@end
