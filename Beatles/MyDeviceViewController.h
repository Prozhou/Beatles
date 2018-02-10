//
//  MyDeviceViewController.h
//  Beatles
//
//  Created by Zhou Chao on 2018/2/7.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyDeviceViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *titleBtnArray;

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;

@property(nonatomic,strong)UICollectionView *boardCollectionView;

@property(nonatomic,strong)UIButton *backBtn;
@end
