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
    [self.backButton setBackgroundColor:[UIColor whiteColor]];
    [self.bleStateBtnView setGradientType:leftToRight fromColors:@[KPEACH,KLAKEBLUE]];
    
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
-(UIButton *)backButton{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_backButton];
        //        [_backButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left).offset(38);
            make.top.equalTo(self.view.mas_top).offset(40);
            make.size.equalTo(CGSizeMake(45, 45));
        }];
        _backButton.layer.borderWidth = 0.5;
        _backButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _backButton.layer.shadowOpacity = 0.3f;
        _backButton.layer.shadowOffset = CGSizeMake(1, 1);
        _backButton.layer.shadowColor = [UIColor blackColor].CGColor;
        _backButton.transform = CGAffineTransformRotate(_backButton.transform, M_PI / 4);
        UIImageView *bgImgV = [[UIImageView alloc]init];
        [bgImgV setImage:[UIImage imageNamed:@"返回"]];
        [_backButton addSubview:bgImgV];
        [bgImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(20, 20));
            make.center.equalTo(_backButton.center);
            //            make.centerY.equalTo(_backButton.mas_centerY);
            //            make.centerX.equalTo(_backButton.mas_centerX).offset(-8);
        }];
        bgImgV.transform = CGAffineTransformRotate(bgImgV.transform, - M_PI / 4);
        [_backButton addTarget:self action:@selector(backToMarketMain) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _backButton;
}
-(void)backToMarketMain{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
