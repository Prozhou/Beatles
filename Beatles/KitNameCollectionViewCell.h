//
//  KitNameCollectionViewCell.h
//  Beatles
//
//  Created by Zhou Chao on 2017/12/20.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM (NSInteger, KitNameCellType)   {
    KitNameCellTypeDefault = 0,
    KitNameCellTypeAdd = 1
};
@interface KitNameCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UIImageView *addImageView;
-(void)renderCellWith:(KitNameCellType )type;
@end
