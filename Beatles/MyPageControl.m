//
//  MyPageControl.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/20.
//  Copyright © 2017年 xiran. All rights reserved.
//
#define dotW 4.5
#define activeDotW 6
#define margin 5

#import "MyPageControl.h"

@implementation MyPageControl
/*-(void)setCurrentPage:(NSInteger)currentPage{
    [super setCurrentPage:currentPage];
    
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) {
        
        UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
        
        CGSize size;
        
        size.height = 4;
        
        size.width = 4;
        
//        [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,size.width,size.height)];
        [subview setFrame:CGRectMake(subviewIndex * 8, subview.frame.origin.y,size.width,size.height)];
    }
}*/
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //计算圆点间距
    CGFloat marginX = margin + 5;
    
    //计算整个pageControll的宽度
    CGFloat newW = (self.subviews.count - 1 ) * marginX;
    
    //设置新frame
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newW, self.frame.size.height);
    
    //设置居中
//    CGPoint center = self.center;
//    center.x = self.superview.center.x;
//    self.center = center;
    
    //遍历subview,设置圆点frame
    for (int i=0; i<[self.subviews count]; i++) {
        UIImageView* dot = [self.subviews objectAtIndex:i];
        
        [dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, dotW, dotW)];
        
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
