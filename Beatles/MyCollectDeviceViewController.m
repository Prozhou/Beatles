//
//  MyCollectDeviceViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2018/1/25.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "MyCollectDeviceViewController.h"

@interface MyCollectDeviceViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation MyCollectDeviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self rectCollectLevelLabel];
    [self rectCollectionView];
    self.backButton.backgroundColor = [UIColor whiteColor];
}
-(void)rectCollectLevelLabel{
    NSMutableAttributedString *levelStr = [[NSMutableAttributedString alloc] initWithString:@"收藏家等级:  2级"];
    [levelStr addAttribute:NSForegroundColorAttributeName
                    value:KBLUE
                    range:NSMakeRange(0, 6)];
    [levelStr addAttribute:NSForegroundColorAttributeName
                    value:KORANGE
                    range:NSMakeRange(8, 2)];
    self.collectLevelLabel.attributedText = levelStr;
}
-(void)rectCollectionView{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    int width = ceil((_mainCollectionView.frame.size.width - 48)/3.0);
    CGFloat cellHeight = 306.0/165*width + 40;
    CGFloat collectionHeight = self.mainCollectionView.frame.size.height;
    CGFloat footHeight = collectionHeight - cellHeight * 2;
    layout.footerReferenceSize = CGSizeMake(SCREENWIDTH - 76, footHeight);
    self.mainCollectionView.collectionViewLayout = layout;
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"MyCollectDeviceCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"deviceCell"];
    [self.mainCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"foot"];
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    int width = ceil((_mainCollectionView.frame.size.width - 48)/3.0);
//    CGFloat cellHeight = 306.0/165*width + 40;
    UICollectionReusableView *footView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        footView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"foot" forIndexPath:indexPath];
//        footView.frame = CGRectMake(0, 0, SCREENWIDTH - 76, cellHeight);
    }
    return footView;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *titleArray = @[@"游戏手柄",@"防狼",@"遥控",@"小剪刀",@"自拍杆",@"神秘单品"];
    MyCollectDeviceCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"deviceCell" forIndexPath:indexPath];
    [cell.deviceImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"收藏%ld",indexPath.row%6+1]]];
    [cell.deviceLabel setText:titleArray[indexPath.row%6]];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    int width = ceil((_mainCollectionView.frame.size.width - 48)/3.0);
    return CGSizeMake(width,306.0/165*width + 40);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (IBAction)addButtonClicked:(UIButton *)sender {

}
-(UIButton *)backButton{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_backButton];
        //        [_backButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left).offset(38);
            make.top.equalTo(self.view.mas_top).offset(50);
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
