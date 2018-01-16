//
//  MarketItemCollectionViewCell.h
//  Beatles
//
//  Created by Zhou Chao on 2018/1/9.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarketItemCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UICollectionView *saleItemCollectionView;

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet MyPageControl *salePageControl;


@end
