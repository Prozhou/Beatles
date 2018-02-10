//
//  LoginViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/18.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.helloLable.backgroundColor = [UIColor whiteColor];
    self.welcomeLabel.backgroundColor = [UIColor whiteColor];
    self.registButton.backgroundColor = [UIColor clearColor];
    self.accountTF.backgroundColor = [UIColor clearColor];
    self.passwardTF.backgroundColor = [UIColor clearColor];
    self.sepLine.backgroundColor = KSEPGRAY;
    self.forgetButton.backgroundColor = [UIColor clearColor];
    self.questionButton.backgroundColor = [UIColor clearColor];
    self.loginButton.backgroundColor = [UIColor whiteColor];
    self.statementLable.backgroundColor = [UIColor clearColor];
    self.point1.backgroundColor = KTEXTGRAY;
    self.point2.backgroundColor = KTEXTGRAY;
}
-(UILabel *)helloLable{
    if (!_helloLable) {
        _helloLable = [[UILabel alloc]init];
        _helloLable.textColor = KBLUE;
        _helloLable.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:48];
        [self.view addSubview:_helloLable];
        _helloLable.text = @"HELLO!";
        
        _helloLable.textAlignment = NSTextAlignmentLeft;
        [_helloLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(SCREENHEIGHT *160.0/1334);
            make.left.equalTo(self.view).offset(34);
        }];
    }
    return _helloLable;
}
-(UILabel *)welcomeLabel{
    if (!_welcomeLabel) {
        _welcomeLabel = [[UILabel alloc]init];
        _welcomeLabel.textColor = [UIColor blackColor];
        _welcomeLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:18];
        [self.view addSubview:_welcomeLabel];
        _welcomeLabel.text = @"欢迎来到铁甲虫，立即";
        [_welcomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_helloLable.mas_bottom).offset(7);
            make.left.equalTo(self.view).offset(38);
        }];
    }
    return _welcomeLabel;
}
-(UIButton *)registButton{
    if (!_registButton) {
        _registButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_registButton];
        [_registButton setTitleColor:KBROWN forState:UIControlStateNormal];
        _registButton.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:18];
        [_registButton setTitle:@"注册" forState:UIControlStateNormal];
        [_registButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_welcomeLabel);
            make.left.equalTo(_welcomeLabel.mas_right);
        }];
    }
    return _registButton;
}
-(UITextField *)accountTF{
    if (!_accountTF) {
        NSMutableAttributedString *typeStr = [[NSMutableAttributedString alloc] initWithString:@"请输入手机号 / 用户名 / 邮箱"];
        [typeStr addAttribute:NSForegroundColorAttributeName
                        value:KTEXTGRAY
                        range:NSMakeRange(0, typeStr.length)];
        
        _accountTF = [[UITextField alloc]init];
        [self.view addSubview:_accountTF];
        _accountTF.borderStyle = UITextBorderStyleNone;
        _accountTF.attributedPlaceholder = typeStr;
        _accountTF.textAlignment = NSTextAlignmentLeft;
        _accountTF.keyboardType = UIKeyboardTypeNumberPad;
        _accountTF.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:18];;
        [_accountTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(38);
            make.right.equalTo(self.view).offset(-38);
            make.top.equalTo(_welcomeLabel.mas_bottom).offset(SCREENHEIGHT *80 / 1334.0);
        }];
        UIView *sepLine = [[UIView alloc]init];
        sepLine.backgroundColor = KSEPGRAY;
        [self.view addSubview:sepLine];
        [sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_accountTF);
            make.top.equalTo(_accountTF.mas_bottom).offset(15);
            make.height.equalTo(0.5);
        }];
    }
    return _accountTF;
}
-(UIView *)point1{
    if (!_point1) {
        _point1 = [[UIView alloc]init];
        [self.view addSubview:_point1];
        [_point1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(4, 4));
            make.centerY.equalTo(_accountTF).offset(3);
            make.right.equalTo(self.view.mas_right).offset(-48);
        }];
        _point1.layer.cornerRadius = 2;
    }
    return _point1;
}
-(UIView *)point2{
    if (!_point2) {
        _point2 = [[UIView alloc]init];
        [self.view addSubview:_point2];
        [_point2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(4, 4));
            make.centerY.equalTo(_passwardTF).offset(3);
            make.right.equalTo(self.view.mas_right).offset(-48);
        }];
        _point2.layer.cornerRadius = 2;
    }
    return _point2;
}

-(UITextField *)passwardTF{
    if (!_passwardTF) {
        NSMutableAttributedString *typeStr = [[NSMutableAttributedString alloc] initWithString:@"请输入密码"];
        [typeStr addAttribute:NSForegroundColorAttributeName
                        value:KTEXTGRAY
                        range:NSMakeRange(0, typeStr.length)];
        _passwardTF = [[UITextField alloc]init];
        [self.view addSubview:_passwardTF];
        _passwardTF.attributedPlaceholder = typeStr;
        _passwardTF.textAlignment = NSTextAlignmentLeft;
        _passwardTF.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:18];;
        [_passwardTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(38);
            make.right.equalTo(self.view).offset(-38);
            make.top.equalTo(_accountTF.mas_bottom).offset(40);
        }];
        UIView *sepLine = [[UIView alloc]init];
        sepLine.backgroundColor = KSEPGRAY;
        [self.view addSubview:sepLine];
        [sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_passwardTF);
            make.top.equalTo(_passwardTF.mas_bottom).offset(15);
            make.height.equalTo(0.5);
        }];
    }
    return _passwardTF;
}
-(UIView *)sepLine{
    if (!_sepLine) {
        _sepLine = [[UIView alloc] init];
        [self.view addSubview:_sepLine];
        [_sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(0.5, 20));
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(self.forgetButton);
            
        }];
    }
    return _sepLine;
}
-(UIButton *)forgetButton{
    if (!_forgetButton) {
        _forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_forgetButton];
        [_forgetButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _forgetButton.titleLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:15];
        [_forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_passwardTF.mas_bottom).offset(30);
            make.right.equalTo(-38);
        }];
    }
    return _forgetButton;
}
-(UIButton *)questionButton{
    if (!_questionButton) {
        _questionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_questionButton];
        [_questionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _questionButton.titleLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:15];
        [_questionButton setTitle:@"登录遇到问题" forState:UIControlStateNormal];
        [_questionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_passwardTF.mas_bottom).offset(30);
            make.left.equalTo(38);
        }];
    }
    return _questionButton;
}
-(UIButton *)loginButton{
    if (!_loginButton) {
        
        
        
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_loginButton];
//        [_loginButton setBackgroundImage:[[UIImage imageNamed:@"方形钩背景2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
//        [_loginButton setImage:[UIImage imageNamed:@"大白钩"] forState:UIControlStateNormal];
        [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(55, 55));
        make.top.equalTo(_questionButton.mas_bottom).offset(90/1334.0*SCREENHEIGHT);
            make.centerX.equalTo(self.view);
        }];
        
        UIImageView *backImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"方形钩背景灰色"]];
        [self.view addSubview:backImageV];
        [self.view insertSubview:backImageV belowSubview:_loginButton];
        [backImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_loginButton);
            make.centerY.equalTo(_loginButton);
            make.size.equalTo(CGSizeMake(80, 80));
        }];
        
        UIImageView *rowImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"大白钩红色"]];
        [self.view addSubview:rowImageV];
        [rowImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_loginButton);
            make.centerY.equalTo(_loginButton);
            make.size.equalTo(CGSizeMake(80, 80));
        }];
        _loginButton.transform = CGAffineTransformRotate(_loginButton.transform, M_PI / 4);
        
//        CABasicAnimation* rotationAnimation = nil;
//
//        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//
//        rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI/4.0];
//
//        rotationAnimation.duration = 0;
//
//        rotationAnimation.cumulative=YES;
//
//        rotationAnimation.repeatCount=1;
//
//        [_loginButton.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
        
        CABasicAnimation* rotationAnimation2 = nil;
        
        rotationAnimation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        
        rotationAnimation2.toValue = [NSNumber numberWithFloat: M_PI*2.0];
        
        rotationAnimation2.duration = 4;
        
        rotationAnimation2.cumulative=YES;
        
        rotationAnimation2.repeatCount=CGFLOAT_MAX;
        
        [backImageV.layer addAnimation:rotationAnimation2 forKey:@"rotationAnimation"];
        
    }
    return _loginButton;
}
-(UILabel *)statementLable{
    if (!_statementLable) {
        NSMutableAttributedString *typeStr = [[NSMutableAttributedString alloc] initWithString:@"登录即表示您同意《隐私条例和服务条款》"];
        [typeStr addAttribute:NSForegroundColorAttributeName
                        value:KTEXTGRAY
                        range:NSMakeRange(0, 8)];
        [typeStr addAttribute:NSForegroundColorAttributeName
                        value:KBLUE
                        range:NSMakeRange(8, 11)];
        [typeStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:15] range:NSMakeRange(0, 11)];
        _statementLable = [[UILabel alloc]init];
        _statementLable.textAlignment = NSTextAlignmentCenter;
        _statementLable.attributedText = typeStr;
        _statementLable.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:15];
        [self.view addSubview:_statementLable];
        [_statementLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view).offset(-20);
            make.centerX.equalTo(self.view);
            make.left.equalTo(self.view.mas_left).offset(38);
            make.right.equalTo(self.view.mas_right).offset(-38);
        }];
    }
    return _statementLable;
}
-(void)login{
    //MainViewController *mainVC = [[MainViewController alloc]init];
    //[self.navigationController pushViewController:mainVC animated:YES];
    BaseTabBarController *tabBar = [[BaseTabBarController alloc]init];
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window setRootViewController:tabBar];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
