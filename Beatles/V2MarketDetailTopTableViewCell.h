//
//  V2MarketDetailTopTableViewCell.h
//  Beatles
//
//  Created by Zhou Chao on 2018/2/6.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface V2MarketDetailTopTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIScrollView *ImageScrollView;
-(void)rectScrollCellWith:(NSArray *)imageArray;
@end
