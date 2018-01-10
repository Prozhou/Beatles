//
//  KitNameCollectionViewCell.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/20.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "KitNameCollectionViewCell.h"

@implementation KitNameCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 50)];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = [UIColor whiteColor];
        [self addSubview:_nameLabel];
        
        _addImageView = [[UIImageView alloc]initWithFrame:CGRectMake(25, 12, 25, 25)];
        [_addImageView setImage:[UIImage imageNamed:@"添加标"]];
        [self addSubview:_addImageView];
    }
    return self;
}
-(void)renderCellWith:(KitNameCellType )type{
    if (type==KitNameCellTypeDefault) {
        _nameLabel.hidden = false;
        _addImageView.hidden =true;
    }else{
        _nameLabel.hidden = true;
        _addImageView.hidden =false;
    }
}
@end
