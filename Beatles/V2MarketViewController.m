//
//  V2MarketViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2018/2/5.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "V2MarketViewController.h"

@interface V2MarketViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@end

@implementation V2MarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self rectTitleButton];
    [self rectProductScrollView];
    self.allCollectionView.backgroundColor = RGBA(105, 110, 117, 1);
    self.boardCollectionView.backgroundColor = RGBA(105, 110, 117, 1);
    self.toolCollectionView.backgroundColor = RGBA(105, 110, 117, 1);
    self.keyCollectionView.backgroundColor = RGBA(105, 110, 117, 1);
    self.otherCollectionView.backgroundColor = RGBA(105, 110, 117, 1);
}

-(void)rectTitleButton{
    for (UIButton *titleButton in self.titleBtnArray) {
        [titleButton addTarget:self action:@selector(titleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)titleButtonClicked:(UIButton *)sender{
    for (UIButton *btn in self.titleBtnArray) {
        if (sender.tag == btn.tag) {
            [btn setTitleColor:KORANGE forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        }
    }
    [self.productScrollView scrollRectToVisible:CGRectMake(SCREENWIDTH *sender.tag, 0, SCREENWIDTH, self.productScrollView.frame.size.height) animated:YES];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    for (UIButton *btn in self.titleBtnArray) {
        if (btn.tag == scrollView.contentOffset.x/SCREENWIDTH) {
            [btn setTitleColor:KORANGE forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        }
    }
}
-(void)rectProductScrollView{
    self.productScrollView.contentSize = CGSizeMake(SCREENWIDTH *5, self.productScrollView.frame.size.height);
//    self.productScrollView.backgroundColor = [UIColor yellowColor];
}

-(UICollectionView *)allCollectionView{
    if (!_allCollectionView) {
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        layout.sectionHeadersPinToVisibleBounds = YES;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _allCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _allCollectionView.clipsToBounds = YES;
        [self.productScrollView addSubview:_allCollectionView];
        _allCollectionView.showsHorizontalScrollIndicator = false;
        _allCollectionView.delegate=self;
        _allCollectionView.dataSource=self;
        [_allCollectionView registerNib:[UINib nibWithNibName:@"V2MarketCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"marketCell"];
        [_allCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"bannerCell"];
        _allCollectionView.frame = CGRectMake(0, 0, SCREENWIDTH, _productScrollView.frame.size.height);
        
    }
    return _allCollectionView;
}
-(UICollectionView *)boardCollectionView{
    if (!_boardCollectionView) {
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        layout.sectionHeadersPinToVisibleBounds = YES;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _boardCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _boardCollectionView.clipsToBounds = YES;
        [self.productScrollView addSubview:_boardCollectionView];
        _boardCollectionView.showsHorizontalScrollIndicator = false;
        _boardCollectionView.delegate=self;
        _boardCollectionView.dataSource=self;
        [_boardCollectionView registerNib:[UINib nibWithNibName:@"V2MarketCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"marketCell"];
        [_boardCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"bannerCell"];
        _boardCollectionView.frame = CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, _productScrollView.frame.size.height);
        
    }
    return _boardCollectionView;
}
-(UICollectionView *)toolCollectionView{
    if (!_toolCollectionView) {
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        layout.sectionHeadersPinToVisibleBounds = YES;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _toolCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _toolCollectionView.clipsToBounds = YES;
        [self.productScrollView addSubview:_toolCollectionView];
        _toolCollectionView.showsHorizontalScrollIndicator = false;
        _toolCollectionView.delegate=self;
        _toolCollectionView.dataSource=self;
        [_toolCollectionView registerNib:[UINib nibWithNibName:@"V2MarketCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"marketCell"];
        [_toolCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"bannerCell"];
        _toolCollectionView.frame = CGRectMake(SCREENWIDTH*2, 0, SCREENWIDTH, _productScrollView.frame.size.height);
        
    }
    return _toolCollectionView;
}
-(UICollectionView *)keyCollectionView{
    if (!_keyCollectionView) {
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        layout.sectionHeadersPinToVisibleBounds = YES;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _keyCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _keyCollectionView.clipsToBounds = YES;
        [self.productScrollView addSubview:_keyCollectionView];
        _keyCollectionView.showsHorizontalScrollIndicator = false;
        _keyCollectionView.delegate=self;
        _keyCollectionView.dataSource=self;
        [_keyCollectionView registerNib:[UINib nibWithNibName:@"V2MarketCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"marketCell"];
        [_keyCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"bannerCell"];
        _keyCollectionView.frame = CGRectMake(SCREENWIDTH*3, 0, SCREENWIDTH, _productScrollView.frame.size.height);
        
    }
    return _keyCollectionView;
}
-(UICollectionView *)otherCollectionView{
    if (!_otherCollectionView) {
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        layout.sectionHeadersPinToVisibleBounds = YES;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _otherCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _otherCollectionView.clipsToBounds = YES;
        [self.productScrollView addSubview:_otherCollectionView];
        _otherCollectionView.showsHorizontalScrollIndicator = false;
        _otherCollectionView.delegate=self;
        _otherCollectionView.dataSource=self;
        [_otherCollectionView registerNib:[UINib nibWithNibName:@"V2MarketCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"marketCell"];
        [_otherCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"bannerCell"];
        _otherCollectionView.frame = CGRectMake(SCREENWIDTH*4, 0, SCREENWIDTH, _productScrollView.frame.size.height);
        
    }
    return _otherCollectionView;
}
#pragma MARK-- UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else{
        return 4;
    }
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = nil;
    if (indexPath.section == 0) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bannerCell" forIndexPath:indexPath];
        UIImageView *bannerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"商城图案"]];
        bannerImage.frame = CGRectMake(0, 0,SCREENWIDTH, SCREENWIDTH*300/750);
        [cell addSubview:bannerImage];
        UIView *sepView = [[UIView alloc]init];
        [cell addSubview:sepView];
        sepView.backgroundColor = KSEPGRAY;
        [sepView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(bannerImage);
            make.height.equalTo(0.5);
        }];
    }else if(indexPath.section == 1){
        NSArray *picArray = @[@"手柄标",@"播放标",@"交通标",@"防狼标"];
        NSArray *titleArray = @[@"游戏手柄",@"无损播放",@"钥匙",@"防狼"];
        V2MarketCollectionViewCell *marketCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"marketCell" forIndexPath:indexPath];
        [marketCell.proImage setImage:[UIImage imageNamed:picArray[indexPath.row]]];
        marketCell.titleLabel.text = titleArray[indexPath.row];
        marketCell.backgroundColor = [UIColor clearColor];
        if (indexPath.row == 2 || indexPath.row == 1) {
            marketCell.labelImage.hidden = YES;
        }
        cell=marketCell;
    }
    return cell;
}
#pragma MARK-- UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return CGSizeMake(SCREENWIDTH, (SCREENWIDTH)*300/750);
    }else{
        return CGSizeMake((SCREENWIDTH)/2,(SCREENWIDTH)/2 *420/374);
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
#pragma MARK-- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
    V2MarketDetailViewController *marketDetailVC = [[V2MarketDetailViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:marketDetailVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
