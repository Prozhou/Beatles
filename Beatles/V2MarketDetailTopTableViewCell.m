//
//  V2MarketDetailTopTableViewCell.m
//  Beatles
//
//  Created by Zhou Chao on 2018/2/6.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "V2MarketDetailTopTableViewCell.h"

@implementation V2MarketDetailTopTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.ImageScrollView.contentSize = CGSizeMake(SCREENWIDTH * 3, SCREENWIDTH *530 / 750);
    // Initialization code
}
-(void)rectScrollCellWith:(NSArray *)imageArray{
    for (UIView *sub in self.ImageScrollView.subviews) {
        [sub removeFromSuperview];
    }
    for (int i = 0; i < imageArray.count; i++) {
        UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageArray[i]]];
        imageV.contentMode = UIViewContentModeCenter;
        imageV.contentScaleFactor = 2;
        imageV.frame = CGRectMake(SCREENWIDTH *i, 0, SCREENWIDTH, SCREENWIDTH *530 / 750 - 10);
        [self.ImageScrollView addSubview:imageV];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
