//
//  MarketViewController.h
//  Beatles
//
//  Created by Zhou Chao on 2017/12/19.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "BaseViewController.h"
#import "MyPageControl.h"
@interface MarketViewController : BaseViewController
@property(nonatomic,strong)UICollectionView *mainCollectionView;


@property(nonatomic,strong)UICollectionView *saleCollectionview;
@property(nonatomic,strong)MyPageControl *salePageControl;
@property(nonatomic,strong)UIView *centerView;
@property(nonatomic,strong)UIImageView *saleImageView;
@property(nonatomic,strong)UIView *descriptionView;
@property(nonatomic,strong)UIButton *carButton;
@end
