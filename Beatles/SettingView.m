//
//  SettingView.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/18.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "SettingView.h"

@implementation SettingView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context,1,1,1,1.0);//画笔线的颜色
    CGContextSetLineWidth(context,1.0);//线的宽度
    CGContextAddArc(context,rect.size.width/2, rect.size.height/2, rect.size.height/2, 0, 2 *M_PI,0);//添加一个圆
//    UIRectFrame(rect);
    CGContextDrawPath(context,kCGPathStroke);//绘制路径

}

@end
