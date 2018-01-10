//
//  KitSettingCollectionReusableView.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/20.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "KitSettingCollectionReusableView.h"

@implementation KitSettingCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:210.0/255 green:210.0/255 blue:210.0/255 alpha:1];
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 20, 20, 20)];
        _imageView.backgroundColor = [UIColor clearColor];
        [_imageView setImage:[UIImage imageNamed:@"设置标"]];
//        _imageView.backgroundColor = [UIColor colorWithRed:250.0/255 green:250.0/255 blue:250.0/255 alpha:.2];
        [self addSubview:_imageView];
    }
    return self;
}
@end
