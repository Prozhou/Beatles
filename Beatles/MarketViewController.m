//
//  MarketViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/19.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "MarketViewController.h"

@interface MarketViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSArray *saleTypeArray;
}

@end

@implementation MarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainCollectionView.backgroundColor = [UIColor clearColor];
    self.carButton.backgroundColor = [UIColor clearColor];
    saleTypeArray = @[@"面板",@"工具",@"其他"];
}

-(UICollectionView *)mainCollectionView{
    if (!_mainCollectionView) {
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        layout.sectionHeadersPinToVisibleBounds = YES;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _mainCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        [self.view addSubview:_mainCollectionView];
        _mainCollectionView.showsHorizontalScrollIndicator = false;
        _mainCollectionView.delegate=self;
        _mainCollectionView.dataSource=self;
//        [_mainCollectionView registerClass:[MarketItemCollectionViewCell class] forCellWithReuseIdentifier:@"marketItemCell"];
        [_mainCollectionView registerNib:[UINib nibWithNibName:@"MarketItemCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"marketItemCell"];
        [_mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(55);
            make.bottom.equalTo(self.view).offset(-15);
            make.left.equalTo(self.view).offset(0);
            make.right.equalTo(self.view).offset(0);
        }];
    }
    return _mainCollectionView;
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
            make.top.left.equalTo(self.view).offset(30);
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
    if (collectionView == _mainCollectionView) {
        return 3;
    }else{
        
    }
    return 3;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = nil;
    if (collectionView == _mainCollectionView) {
        MarketItemCollectionViewCell *marketCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"marketItemCell" forIndexPath:indexPath];
        
        marketCell.backgroundColor = [UIColor colorWithRed:247.0/255 green:252.0/255 blue:251.0/255 alpha:1];
        NSMutableAttributedString *typeStr = [[NSMutableAttributedString alloc] initWithString:saleTypeArray[indexPath.row]];
        [typeStr addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:27]
                        range:NSMakeRange(0, 2)];
//        [typeStr addAttribute:NSFontAttributeName
//                        value:[UIFont fontWithName:@"SourceHanSansCN-Light" size:24]
//                        range:NSMakeRange(2, 2)];
        if (indexPath.row == 0) {
            marketCell.typeLabel.textColor = KBROWN;
            marketCell.typeLabel.text = @"面板";
        }else if(indexPath.row == 1){
            marketCell.typeLabel.textColor = [UIColor colorWithRed:154.0/255.0 green:28/255.0 blue:124/255.0 alpha:1];
            marketCell.typeLabel.text = @"工具";
        }else if(indexPath.row == 2){
            marketCell.typeLabel.textColor = KBLUE;
            marketCell.typeLabel.text = @"其他";
        }
        marketCell.typeLabel.attributedText = typeStr;
        marketCell.saleItemCollectionView.delegate =self;
        marketCell.saleItemCollectionView.dataSource = self;
        marketCell.saleItemCollectionView.tag = indexPath.row;
        marketCell.saleItemCollectionView.pagingEnabled = YES;
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        layout.sectionHeadersPinToVisibleBounds = YES;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        marketCell.saleItemCollectionView.collectionViewLayout = layout;
        
        
        marketCell.saleItemCollectionView.showsHorizontalScrollIndicator = false;
        [marketCell.saleItemCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"saleCell"];
        cell = marketCell;
    }else{
        NSArray *nameArray = @[@"无损播放",@"小剪刀",@"神秘单品"];
        UICollectionViewCell *imageCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"saleCell" forIndexPath:indexPath];
        imageCell.backgroundColor = [UIColor colorWithRed:247.0/255 green:252.0/255 blue:251.0/255 alpha:1];
        for (UIView *sub in imageCell.subviews) {
            [sub removeFromSuperview];
        }
        UIImageView *saleImageV = [[UIImageView alloc] init];
        saleImageV.backgroundColor = [UIColor colorWithRed:247.0/255 green:252.0/255 blue:251.0/255 alpha:1];
        [saleImageV setImage:[UIImage imageNamed:[NSString stringWithFormat:@"商城%ld",collectionView.tag+1]]];
        [imageCell addSubview:saleImageV];
        [saleImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imageCell);
            make.bottom.equalTo(imageCell).offset(0);
            make.centerX.equalTo(imageCell);
            make.height.equalTo(saleImageV.mas_width).multipliedBy(313/750.0);
        }];
//        NSMutableAttributedString *typeStr = [[NSMutableAttributedString alloc] initWithString:@"面板配件"];
//        [typeStr addAttribute:NSFontAttributeName
//                        value:[UIFont fontWithName:@"SourceHanSansCN-Medium" size:24]
//                        range:NSMakeRange(0, 2)];
//        [typeStr addAttribute:NSFontAttributeName
//                        value:[UIFont fontWithName:@"SourceHanSansCN-Light" size:24]
//                        range:NSMakeRange(2, 2)];
//        UILabel *typeLabel = [[UILabel alloc]init];
//        [imageCell addSubview:typeLabel];
//        typeLabel.textColor = KBROWN;
//        typeLabel.attributedText = typeStr;
//        typeLabel.textAlignment = NSTextAlignmentRight;
//        [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(imageCell).offset(20);
//            make.right.equalTo(imageCell).offset(-50);
//        }];
        
        UILabel *nameLabel = [[UILabel alloc]init];
        [imageCell addSubview:nameLabel];
        nameLabel.textColor = KBLUE;
        nameLabel.text = nameArray[collectionView.tag];
        nameLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:18];
        nameLabel.textAlignment = NSTextAlignmentRight;
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imageCell).offset(54);
            make.right.equalTo(imageCell).offset(-50);
        }];
        
//        NSMutableAttributedString *priceStr = [[NSMutableAttributedString alloc] initWithString:@"¥299"];
//        [priceStr addAttribute:NSFontAttributeName
//                        value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:12]
//                        range:NSMakeRange(0, 1)];
//        [priceStr addAttribute:NSFontAttributeName
//                        value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:15]
//                        range:NSMakeRange(1, priceStr.length - 1)];
        NSString *priceStr = @"¥299";
        
        
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.font = [UIFont systemFontOfSize:15];
        [imageCell addSubview:priceLabel];
        priceLabel.textColor = KBLUE;
//        priceLabel.attributedText = priceStr;
        priceLabel.text = priceStr;
        priceLabel.textAlignment = NSTextAlignmentRight;
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(nameLabel.mas_bottom).offset(5);
            make.right.equalTo(imageCell).offset(-50);
        }];
        cell = imageCell;
    }
    return cell;
}
#pragma MARK-- UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == _mainCollectionView) {
        return CGSizeMake(SCREENWIDTH,SCREENWIDTH *360/750);
    }else{
        return CGSizeMake(SCREENWIDTH,SCREENWIDTH *315/750);
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if(collectionView == self.mainCollectionView){
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }else{
        return UIEdgeInsetsMake(-22, 0, 0, 0);
    }
}
#pragma MARK-- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
    MarketDetailViewController *marketDetailVC = [[MarketDetailViewController alloc]init];
    [self.navigationController pushViewController:marketDetailVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
