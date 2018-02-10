//
//  V2MarketViewController.h
//  Beatles
//
//  Created by Zhou Chao on 2018/2/5.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface V2MarketViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *titleBtnArray;
@property (weak, nonatomic) IBOutlet UIScrollView *productScrollView;
@property (nonatomic,strong)UICollectionView *allCollectionView;
@property (nonatomic,strong)UICollectionView *boardCollectionView;
@property (nonatomic,strong)UICollectionView *toolCollectionView;
@property (nonatomic,strong)UICollectionView *keyCollectionView;
@property (nonatomic,strong)UICollectionView *otherCollectionView;


@end
