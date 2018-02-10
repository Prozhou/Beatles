//
//  RecommandKitTableViewCell.m
//  Beatles
//
//  Created by Zhou Chao on 2018/2/5.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "RecommandKitTableViewCell.h"

@implementation RecommandKitTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGRect labelRect = [_titleLabel.text boundingRectWithSize:CGSizeMake(SCREENWIDTH, 26) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:21]} context:nil];
    NSLog(@"%f",labelRect.size.width);
    _cellWidth.constant = labelRect.size.width + 30;
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:self.titleLabel.text];
    NSUInteger length = [self.titleLabel.text length];
    NSMutableParagraphStyle *
    style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.tailIndent = -10; //设置与尾部的距离
    style.alignment = NSTextAlignmentRight;//靠右显示
    [attrString addAttribute:NSParagraphStyleAttributeName value:style
                       range:NSMakeRange(0, length)];
    self.titleLabel.attributedText = attrString;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
