//
//  V2MarketDetailAskTableViewCell.m
//  Beatles
//
//  Created by Zhou Chao on 2018/2/6.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "V2MarketDetailAskTableViewCell.h"

@implementation V2MarketDetailAskTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    NSMutableAttributedString *quesStr = [[NSMutableAttributedString alloc] initWithString:self.quesLabel.text];
    [quesStr addAttribute:NSForegroundColorAttributeName
                      value:KORANGE
                      range:NSMakeRange(0, 2)];
    self.quesLabel.attributedText = quesStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
