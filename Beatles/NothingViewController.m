//
//  NothingViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2018/1/26.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "NothingViewController.h"

@interface NothingViewController ()

@end

@implementation NothingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.backBtn setBackgroundColor:[UIColor whiteColor]];
    if (self.nothingType == 0) {
        self.rabbitImage.hidden = YES;
        self.rabbitLabel.hidden = YES;
    }else{
        self.manLabel.hidden = YES;
        self.manImageView.hidden = YES;
//        [UIView animateWithDuration:2 animations:^{
//            self.bottomSep.constant = 200;
//        }];
    }
}

-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        _backBtn.layer.cornerRadius = 32;
        _backBtn.layer.borderWidth = 0.5;
        _backBtn.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3].CGColor;
        _backBtn.layer.shadowOpacity = 0.1f;
        _backBtn.layer.shadowOffset = CGSizeMake(0.5, 0.5);
        _backBtn.layer.shadowColor = [UIColor blackColor].CGColor;
        [_backBtn setBackgroundImage:[UIImage imageNamed:@"返回2"] forState:UIControlStateNormal];
        [self.view addSubview:_backBtn];
        [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(25);
            make.size.equalTo(CGSizeMake(102, 64));
            make.centerX.equalTo(self.view.mas_left);
        }];
    }
    return _backBtn;
}
-(void)back{
    if (_nothingType == NothingType2) {
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
