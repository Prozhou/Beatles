//
//  CALayer+LayerColor.m
//  Beatles
//
//  Created by Zhou Chao on 2018/1/12.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "CALayer+LayerColor.h"

@implementation CALayer (LayerColor)
- (void)setBorderColorFromUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

@end
