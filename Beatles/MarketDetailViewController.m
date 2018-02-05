//
//  MarketDetailViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2018/1/9.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "MarketDetailViewController.h"

@interface MarketDetailViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation MarketDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    _saleDescCollectionView.pagingEnabled = YES;
    _kitCollectionView.pagingEnabled = YES;
//    _saleDescCollectionView.
    [_saleDescCollectionView registerNib:[UINib nibWithNibName:@"MarketDetailDescCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"saleDescCell"];
    [_kitCollectionView registerNib:[UINib nibWithNibName:@"MarketKitCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"kitCell"];
    self.carButton.backgroundColor = [UIColor clearColor];
    self.backButton.backgroundColor = [UIColor whiteColor];
    [self.buyBtnView setGradientType:leftToRight fromColors:@[KPEACH,KLAKEBLUE]];
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
        _backButton.transform = CGAffineTransformRotate(_carButton.transform, M_PI / 4);
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
-(UIButton *)carButton{
    if (!_carButton) {
        _carButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIPanGestureRecognizer *pan =[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
        [_carButton addGestureRecognizer:pan];
        [_carButton setBackgroundImage:[UIImage imageNamed:@"购物车"] forState:UIControlStateNormal];
        [self.view addSubview:_carButton];
        [_carButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(50, 50));
            make.right.equalTo(self.view).offset(-30);
            make.centerY.equalTo(self.view);
        }];
        _carButton.layer.cornerRadius = 25.0f;
        _carButton.layer.shadowOpacity = 0.8f;
        _carButton.layer.shadowOffset = CGSizeMake(1, 1);
        _carButton.layer.shadowColor = [UIColor grayColor].CGColor;
    }
    return _carButton;
}
-(void)panAction:(UIPanGestureRecognizer *)pan
{
    //获取手势的位置
    CGPoint position =[pan translationInView:_carButton];
    //通过stransform 进行平移交换
    _carButton.transform = CGAffineTransformTranslate(_carButton.transform, position.x, position.y);
    //将增量置为零
    [pan setTranslation:CGPointZero inView:_carButton];
}
#pragma MARK-- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView == _saleDescCollectionView) {
        return 3;
    }else{
        
    }
    return 3;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = nil;
    if (collectionView == _saleDescCollectionView) {
        MarketDetailDescCollectionViewCell *descCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"saleDescCell" forIndexPath:indexPath];
//        NSMutableAttributedString *typeStr = [[NSMutableAttributedString alloc] initWithString:@"面板配件"];
//        [typeStr addAttribute:NSFontAttributeName
//                        value:[UIFont fontWithName:@"SourceHanSansCN-Medium" size:24]
//                        range:NSMakeRange(0, 2)];
//        [typeStr addAttribute:NSFontAttributeName
//                        value:[UIFont fontWithName:@"SourceHanSansCN-Light" size:24]
//                        range:NSMakeRange(2, 2)];
//        _typeLabel.attributedText = typeStr;
//
//        NSMutableAttributedString *priceStr = [[NSMutableAttributedString alloc] initWithString:@"¥399"];
//        [priceStr addAttribute:NSFontAttributeName
//                        value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:15]
//                        range:NSMakeRange(0, 1)];
//        [priceStr addAttribute:NSFontAttributeName
//                        value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:18]
//                        range:NSMakeRange(1, 2)];
//        descCell.priceLable.attributedText = priceStr;
        cell = descCell;
    }else{
        MarketKitCollectionViewCell *kitCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kitCell" forIndexPath:indexPath];
        cell = kitCell;
    }
    return cell;
}
#pragma MARK-- UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return collectionView.frame.size;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
#pragma MARK-- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
    
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
