//
//  MainCollectionViewCell.h
//  Beatles
//
//  Created by Zhou Chao on 2017/12/19.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM (NSInteger, mainCollectionCellType)   {
    mainCollectionTypeDefault = 0,
    mainCollectionTypeUnSelected = 1,
    mainCollectionTypeSelected = 2
};
@interface MainCollectionViewCell : UICollectionViewCell
@property(nonatomic,assign)mainCollectionCellType cellType;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UIButton *selectButton;
-(void)renderCellWith:(mainCollectionCellType )type;
@end
