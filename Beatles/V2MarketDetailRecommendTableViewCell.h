//
//  V2MarketDetailRecommendTableViewCell.h
//  Beatles
//
//  Created by Zhou Chao on 2018/2/6.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface V2MarketDetailRecommendTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;

-(void)rectRecommendCellWith:(NSArray *)imagesArray;
@end
