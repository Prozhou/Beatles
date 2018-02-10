//
//  SelectColorTableViewCell.m
//  Beatles
//
//  Created by Zhou Chao on 2018/2/6.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "SelectColorTableViewCell.h"

@implementation SelectColorTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    NSMutableAttributedString *selectStr = [[NSMutableAttributedString alloc] initWithString:self.selectLabel.text];
    [selectStr addAttribute:NSForegroundColorAttributeName
                     value:KTEXTGRAY
                     range:NSMakeRange(0, 3)];
    self.selectLabel.attributedText = selectStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
