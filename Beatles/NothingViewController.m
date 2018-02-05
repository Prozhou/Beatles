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
    [self.backButton setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view from its nib.
}
-(UIButton *)backButton{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_backButton];
        //        [_backButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left).offset(38);
            make.top.equalTo(self.view.mas_top).offset(35);
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
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
