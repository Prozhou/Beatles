//
//  V2MarketDetailNameTableViewCell.m
//  Beatles
//
//  Created by Zhou Chao on 2018/2/6.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "V2MarketDetailNameTableViewCell.h"

@implementation V2MarketDetailNameTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    NSMutableAttributedString *typeStr = [[NSMutableAttributedString alloc] initWithString:self.descLabel.text];
    NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle  setLineSpacing:3];
    [typeStr addAttribute:NSParagraphStyleAttributeName
                    value:paragraphStyle
                    range:NSMakeRange(0, typeStr.length)];
    self.descLabel.attributedText = typeStr;
    
    NSMutableAttributedString *priceStr = [[NSMutableAttributedString alloc] initWithString:self.priceLabel.text];
    
    [priceStr addAttribute:NSFontAttributeName
                    value:KFONT(18)
                    range:NSMakeRange(0, 1)];
    self.priceLabel.attributedText = priceStr;
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
