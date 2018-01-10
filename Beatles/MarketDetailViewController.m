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
    _saleDescCollectionView.pagingEnabled = YES;
    _kitCollectionView.pagingEnabled = YES;
//    _saleDescCollectionView.
    [_saleDescCollectionView registerNib:[UINib nibWithNibName:@"MarketDetailDescCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"saleDescCell"];
    [_kitCollectionView registerNib:[UINib nibWithNibName:@"MarketKitCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"kitCell"];
    
    // Do any additional setup after loading the view from its nib.
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
