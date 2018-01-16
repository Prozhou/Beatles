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
    self.forgetButton.backgroundColor = [UIColor clearColor];
    self.questionButton.backgroundColor = [UIColor clearColor];
    self.loginButton.backgroundColor = [UIColor clearColor];
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
            make.top.equalTo(SCREENHEIGHT *170.0/1334);
            make.left.equalTo(self.view).offset(34);
        }];
    }
    return _helloLable;
}
-(UILabel *)welcomeLabel{
    if (!_welcomeLabel) {
        _welcomeLabel = [[UILabel alloc]init];
        _welcomeLabel.textColor = KBLUE;
        _welcomeLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:18];
        [self.view addSubview:_welcomeLabel];
        _welcomeLabel.text = @"欢迎来到铁甲虫，立即";
        [_welcomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_helloLable.mas_bottom).offset(10);
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
        _accountTF = [[UITextField alloc]init];
        [self.view addSubview:_accountTF];
        _accountTF.borderStyle = UITextBorderStyleNone;
        _accountTF.placeholder = @"请输入手机号/用户名/邮箱";
        _accountTF.textAlignment = NSTextAlignmentLeft;
        _accountTF.keyboardType = UIKeyboardTypeNumberPad;
        _accountTF.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:18];;
        [_accountTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(38);
            make.right.equalTo(self.view).offset(-38);
            make.top.equalTo(_welcomeLabel.mas_bottom).offset(SCREENHEIGHT *130 / 1334.0);
        }];
        UIView *sepLine = [[UIView alloc]init];
        sepLine.backgroundColor = KGREY;
        [self.view addSubview:sepLine];
        [sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_accountTF);
            make.top.equalTo(_accountTF.mas_bottom).offset(15);
            make.height.equalTo(0.5);
        }];
    }
    return _accountTF;
}
-(UITextField *)passwardTF{
    if (!_passwardTF) {
        _passwardTF = [[UITextField alloc]init];
        [self.view addSubview:_passwardTF];
        _passwardTF.placeholder = @"请输入密码";
        _passwardTF.textAlignment = NSTextAlignmentLeft;
        _passwardTF.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:18];;
        [_passwardTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(38);
            make.right.equalTo(self.view).offset(-38);
            make.top.equalTo(_accountTF.mas_bottom).offset(40);
        }];
        UIView *sepLine = [[UIView alloc]init];
        sepLine.backgroundColor = KGREY;
        [self.view addSubview:sepLine];
        [sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_passwardTF);
            make.top.equalTo(_passwardTF.mas_bottom).offset(15);
            make.height.equalTo(0.5);
        }];
    }
    return _passwardTF;
}
-(UIButton *)forgetButton{
    if (!_forgetButton) {
        _forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_forgetButton];
        [_forgetButton setTitleColor:KBLUE forState:UIControlStateNormal];
        _forgetButton.titleLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:18];
        [_forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_passwardTF.mas_bottom).offset(45);
            make.right.equalTo(-38);
        }];
    }
    return _forgetButton;
}
-(UIButton *)questionButton{
    if (!_questionButton) {
        _questionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_questionButton];
        [_questionButton setTitleColor:KBLUE forState:UIControlStateNormal];
        _questionButton.titleLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:18];
        [_questionButton setTitle:@"登录遇到问题" forState:UIControlStateNormal];
        [_questionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_passwardTF.mas_bottom).offset(45);
            make.left.equalTo(38);
        }];
    }
    return _questionButton;
}
-(UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_loginButton];
        [_loginButton setBackgroundImage:[[UIImage imageNamed:@"方形钩"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(80, 80));
            make.top.equalTo(_questionButton.mas_bottom).offset(100/1334.0*SCREENHEIGHT);
            make.centerX.equalTo(self.view);
        }];
    }
    return _loginButton;
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
