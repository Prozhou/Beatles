//
//  BatteryViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2018/1/26.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "BatteryViewController.h"

@interface BatteryViewController ()

@end

@implementation BatteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.bleStateBtnView setGradientType:leftToRight fromColors:@[KPEACH,KLAKEBLUE]];
    
    NSMutableAttributedString *typeStr = [[NSMutableAttributedString alloc] initWithString:@"75%"];
    [typeStr addAttribute:NSFontAttributeName
                    value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:18]
                    range:NSMakeRange(0, 2)];
    [typeStr addAttribute:NSFontAttributeName
                    value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:15]
                    range:NSMakeRange(2, 1)];
    _battetyLabel.attributedText = typeStr;
    
    for (UILabel *label in self.itemLabelLabelArray) {
        NSRange range = [label.text rangeOfString:@"%"];
        NSMutableAttributedString *typeStr = [[NSMutableAttributedString alloc] initWithString:label.text];
        [typeStr addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:15]
                        range:range];
        label.attributedText = typeStr;
    }
    
    NSMutableAttributedString *timeStr = [[NSMutableAttributedString alloc]initWithString:_timeLabel.text];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[0-9]+" options:0 error:nil];
    NSArray *matches = [regex matchesInString:_timeLabel.text options:0 range:NSMakeRange(0, _timeLabel.text.length)];
    for (NSTextCheckingResult *result in [matches objectEnumerator]) {
        NSRange matchRange = [result range];
        [timeStr addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:24]
                        range:matchRange];
    }
    _timeLabel.attributedText = timeStr;
    
    [self rectSingelImageView];
    
    
}

-(void)rectSingelImageView{
    NSMutableArray *imageArray = [NSMutableArray array];
    for (int i = 1; i<5; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"信号%d",i]];
        [imageArray addObject:image];
    }
    self.singleImageView.animationImages = imageArray;
    self.singleImageView.animationDuration = 1.5;
    self.singleImageView.animationRepeatCount = 0;
    [self.singleImageView startAnimating];
}
-(void)backToMarketMain{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
