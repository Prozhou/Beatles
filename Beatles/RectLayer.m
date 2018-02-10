//
//  RectLayer.m
//  Beatles
//
//  Created by Zhou Chao on 2018/2/9.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "RectLayer.h"

@implementation RectLayer
-(void)drawInContext:(CGContextRef)ctx{
    self.shouldRasterize = YES;
    UIGraphicsPushContext(ctx);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(ceil(self.frame.size.width/2), ceil(self.frame.size.height/2)) radius:25 startAngle:0 endAngle:360 clockwise:YES];
    path.lineWidth = 0.5;
    [RGBA(232, 232, 232, 1) setStroke];
    [path stroke];
    
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(ceil(self.frame.size.width/2), ceil(self.frame.size.height/2) -25) radius:2 startAngle:0 endAngle:360 clockwise:YES];
    [KORANGE setFill];
    [path2 fill];
    
    UIGraphicsPopContext();
    
    CABasicAnimation* rotationAnimation2 = nil;
    
    rotationAnimation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation2.removedOnCompletion = false;
    rotationAnimation2.toValue = [NSNumber numberWithFloat: M_PI*2.0];
    
    rotationAnimation2.duration = 4;
    
    rotationAnimation2.cumulative=YES;
    
    rotationAnimation2.repeatCount=CGFLOAT_MAX;
    
    [self addAnimation:rotationAnimation2 forKey:@"rotationAnimation"];
}
@end
