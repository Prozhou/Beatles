//
//  SettingItemTextCollectionViewCell.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/22.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "SettingItemTextCollectionViewCell.h"

@implementation SettingItemTextCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 34)];
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.text = @"大小尺寸";
        [self addSubview:_titleLabel];
        UIView *baselineView = [[UIView alloc]initWithFrame:CGRectMake(0, 34, frame.size.width, 1)];
        baselineView.backgroundColor = [UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1];
        [self addSubview:baselineView];
        UIImageView *rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width-40, 2, 30, 30)];
        rightImageView.image = [UIImage imageNamed:@"蓝色钩框"];
        [self addSubview:rightImageView];
    }
    return self;
}
@end
