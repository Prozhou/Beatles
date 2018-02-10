//
//  AdressTableViewCell.m
//  Beatles
//
//  Created by Zhou Chao on 2018/2/6.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "AdressTableViewCell.h"

@implementation AdressTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    NSMutableAttributedString *addressStr = [[NSMutableAttributedString alloc] initWithString:self.addressLabel.text];
    [addressStr addAttribute:NSForegroundColorAttributeName
                      value:KTEXTGRAY
                      range:NSMakeRange(0, 4)];
    [addressStr addAttribute:NSForegroundColorAttributeName
                       value:KORANGE
                       range:NSMakeRange(11, 3)];
    self.addressLabel.attributedText = addressStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
