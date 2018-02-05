//
//  NoDistrubHeaderFooterView.m
//  Beatles
//
//  Created by Zhou Chao on 2018/1/24.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "NoDistrubHeaderFooterView.h"

@implementation NoDistrubHeaderFooterView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    self.textLabel.font = [UIFont italicSystemFontOfSize:10];
    self.contentView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
}


@end
