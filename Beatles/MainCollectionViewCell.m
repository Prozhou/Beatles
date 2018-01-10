//
//  MainCollectionViewCell.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/19.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "MainCollectionViewCell.h"

@implementation MainCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width-3, frame.size.height-3)];
        _imageView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.03];
        [self addSubview:_imageView];
        _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectButton.frame = CGRectMake(frame.size.width-40, 0, 40, 40);
//        _selectButton.enabled = false;
        [_selectButton setImage:[UIImage imageNamed:@"白色框"] forState:UIControlStateNormal];
        [_selectButton setImage:[UIImage imageNamed:@"蓝色钩框"] forState:UIControlStateSelected];
        [self addSubview:_selectButton];
    }
    return self;
}
-(void)renderCellWith:(mainCollectionCellType )type{
    if (type == mainCollectionTypeDefault) {
        _selectButton.hidden = YES;
    }else if(type == mainCollectionTypeUnSelected){
        _selectButton.hidden =false;
        _selectButton.selected = false;
    }else if (type == mainCollectionTypeSelected){
        _selectButton.hidden = false;
        _selectButton.selected = YES;
    }
}
@end
