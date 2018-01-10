//
//  KitImageCollectionViewCell.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/20.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "KitImageCollectionViewCell.h"

@implementation KitImageCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _imageView.backgroundColor = [UIColor colorWithRed:250.0/255 green:250.0/255 blue:250.0/255 alpha:.2];
        [self addSubview:_imageView];
    }
    return self;
}
@end
