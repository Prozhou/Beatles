//
//  MarketDetailViewController.h
//  Beatles
//
//  Created by Zhou Chao on 2018/1/9.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarketDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *saleDescCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *kitCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property(nonatomic,strong)UIButton *carButton;
@property(nonatomic,strong)UIButton *backButton;
@end
