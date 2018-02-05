//
//  UIButton+Gradient.h
//  Beatles
//
//  Created by Zhou Chao on 2018/1/26.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum  {
    topToBottom = 0,//从上到小
    leftToRight = 1,//从左到右
    upleftTolowRight = 2,//左上到右下
    uprightTolowLeft = 3,//右上到左下
}GradientType;

@interface UIButton (Gradient)
-(void)setGradientType:(GradientType)gradientType fromColors:(NSArray*)colors;

@end
