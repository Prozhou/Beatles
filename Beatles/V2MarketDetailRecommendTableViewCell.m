//
//  V2MarketDetailRecommendTableViewCell.m
//  Beatles
//
//  Created by Zhou Chao on 2018/2/6.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "V2MarketDetailRecommendTableViewCell.h"

@implementation V2MarketDetailRecommendTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)rectRecommendCellWith:(NSArray *)imagesArray{
    for (int i=0; i<imagesArray.count; i++) {
        UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imagesArray[i][@"pic"]]];
        imageV.layer.borderWidth = 0.5;
        imageV.layer.borderColor = KSEPGRAY.CGColor;
        imageV.frame = CGRectMake(6 + (127 + 6)*i , 0, 127, 145);
        [self.mainScrollView addSubview:imageV];
        
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.font = KFONT(12);
        priceLabel.textColor = KORANGE;
        [imageV addSubview:priceLabel];
        priceLabel.text = imagesArray[i][@"price"];
        priceLabel.frame= CGRectMake(9, 128, 120, 12);
        
        NSMutableAttributedString *priceStr = [[NSMutableAttributedString alloc] initWithString:imagesArray[i][@"price"]];
        [priceStr addAttribute:NSFontAttributeName
                          value:KFONT(10)
                          range:NSMakeRange(0, 1)];
        priceLabel.attributedText = priceStr;


        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.textColor = [UIColor blackColor];
        nameLabel.font = KFONT(12);
        [imageV addSubview:nameLabel];
        nameLabel.text = imagesArray[i][@"name"];
        nameLabel.frame= CGRectMake(9, 110, 120, 12);
        
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
