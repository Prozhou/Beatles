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
    //self.saleCollectionview.backgroundColor = [UIColor clearColor];
    //self.salePageControl.backgroundColor = [UIColor clearColor];
    //self.centerView.backgroundColor = [UIColor clearColor];
    self.carButton.backgroundColor = [UIColor clearColor];
    saleTypeArray = @[@"面板配件",@"工具配件",@"其他配件"];
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
            make.top.equalTo(self.view.mas_top).offset(50);
            make.bottom.equalTo(self.view).offset(-30);
            make.left.equalTo(self.view).offset(38);
            make.right.equalTo(self.view).offset(-38);
        }];
    }
    return _mainCollectionView;
}
-(UICollectionView *)saleCollectionview{
    if (!_saleCollectionview) {
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        layout.sectionHeadersPinToVisibleBounds = YES;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _saleCollectionview = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        [self.view addSubview:_saleCollectionview];
        _saleCollectionview.showsHorizontalScrollIndicator = false;
        _saleCollectionview.delegate=self;
        _saleCollectionview.dataSource=self;
        [_saleCollectionview registerClass:[KitImageCollectionViewCell class] forCellWithReuseIdentifier:@"kitImageCellId"];
        [_saleCollectionview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(35);
            make.size.equalTo(CGSizeMake(SCREENWIDTH, 80));
        }];
        UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:_saleCollectionview.bounds];
        bgImageView.image = [UIImage imageNamed:@"商城上横幅"];
        _saleCollectionview.backgroundView = bgImageView;
    }
    return _saleCollectionview;
}
-(MyPageControl *)salePageControl{
    _salePageControl = [[MyPageControl alloc]init];
    _salePageControl.backgroundColor = [UIColor yellowColor];
    _salePageControl.tintColor = [UIColor yellowColor];
    _salePageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _salePageControl.currentPageIndicatorTintColor = BLUECOLOR;
    _salePageControl.numberOfPages = 3;
    [self.view addSubview:_salePageControl];
    [_salePageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_saleCollectionview.mas_bottom);
        make.size.equalTo(CGSizeMake(SCREENWIDTH,10));
    }];
    return _salePageControl;
}
-(UIView *)centerView{
    if (!_centerView) {
        _centerView = [[UIView alloc]init];
        [self.view addSubview:_centerView];
        self.saleImageView.backgroundColor = [UIColor clearColor];
        self.descriptionView.backgroundColor = [UIColor clearColor];
        [_centerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(SCREENWIDTH, SCREENHEIGHT*720/1334));
            make.top.equalTo(_salePageControl.mas_bottom);
            make.left.equalTo(self.view.mas_left);
        }];
    }
    return _centerView;
}
-(UIImageView *)saleImageView{
    if (!_saleImageView) {
        _saleImageView = [[UIImageView alloc]init];
        [_saleImageView setImage:[UIImage imageNamed:@"商城界面产品"]];
        [_centerView addSubview:_saleImageView];
        [_saleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(SCREENWIDTH * 270 / 750, SCREENWIDTH *270*733/750/412));
            make.right.equalTo(_centerView.mas_centerX);
            make.centerY.equalTo(_centerView);
        }];
    }
    return _saleImageView;
}
-(UIView *)descriptionView{
    if (!_descriptionView) {
        _descriptionView = [[UIView alloc]init];
        [_centerView addSubview:_descriptionView];
        [_descriptionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_centerView.mas_top).offset(30);
            make.left.equalTo(_saleImageView.mas_right).offset(40);
            make.bottom.equalTo(_centerView);
            make.right.equalTo(_centerView).offset(-40);
        }];
        
        UILabel *nameLabel = [[UILabel alloc]init];
        [_descriptionView addSubview:nameLabel];
        nameLabel.text=@"智能遥控";
        nameLabel.font = [UIFont systemFontOfSize:15];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(_descriptionView.mas_width);
            make.height.equalTo(20);
            make.top.equalTo(_descriptionView);
            make.left.equalTo(_descriptionView);
        }];
        
        UILabel *priceLabel = [[UILabel alloc]init];
        [_descriptionView addSubview:priceLabel];
        priceLabel.text=@"¥299";
        priceLabel.font = [UIFont systemFontOfSize:15];
        priceLabel.textAlignment = NSTextAlignmentCenter;
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(_descriptionView.mas_width);
            make.height.equalTo(20);
            make.top.equalTo(nameLabel.mas_bottom);
            make.left.equalTo(_descriptionView);
        }];
        
        UILabel *descLabel = [[UILabel alloc]init];
        [_descriptionView addSubview:descLabel];
        descLabel.numberOfLines = 0;
        descLabel.text=@"这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述";
        descLabel.font = [UIFont systemFontOfSize:12];
        descLabel.textAlignment = NSTextAlignmentLeft;
//        descLabel.preferredMaxLayoutWidth = _descriptionView.frame.size.width;
        [descLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(priceLabel.mas_bottom).offset(5);
            make.right.equalTo(0);
            make.left.equalTo(0);
        }];
    }
    return _descriptionView;
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
        NSMutableAttributedString *typeStr = [[NSMutableAttributedString alloc] initWithString:saleTypeArray[indexPath.row]];
        [typeStr addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"SourceHanSansCN-Medium" size:24]
                        range:NSMakeRange(0, 2)];
        [typeStr addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"SourceHanSansCN-Light" size:24]
                        range:NSMakeRange(2, 2)];
        if (indexPath.row == 0) {
            marketCell.typeLabel.textColor = KBROWN;
        }else if(indexPath.row == 1){
            marketCell.typeLabel.textColor = [UIColor colorWithRed:148.0/255.0 green:60/255.0 blue:118/255.0 alpha:1];
        }else if(indexPath.row == 2){
            marketCell.typeLabel.textColor = [UIColor colorWithRed:54.0/255.0 green:16/255.0 blue:130/255.0 alpha:1];
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
        UICollectionViewCell *imageCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"saleCell" forIndexPath:indexPath];
        for (UIView *sub in imageCell.subviews) {
            [sub removeFromSuperview];
        }
        UIImageView *saleImageV = [[UIImageView alloc] init];
        [saleImageV setImage:[UIImage imageNamed:@"商城1"]];
        [imageCell addSubview:saleImageV];
        [saleImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imageCell).offset(10);
            make.bottom.equalTo(imageCell).offset(-10);
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
        nameLabel.text = @"播放器";
        nameLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:18];
        nameLabel.textAlignment = NSTextAlignmentRight;
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imageCell).offset(54);
            make.right.equalTo(imageCell).offset(-50);
        }];
        
        NSMutableAttributedString *priceStr = [[NSMutableAttributedString alloc] initWithString:@"¥299"];
        [priceStr addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:12]
                        range:NSMakeRange(0, 1)];
        [priceStr addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:15]
                        range:NSMakeRange(1, priceStr.length - 1)];
        
        UILabel *priceLabel = [[UILabel alloc]init];
        [imageCell addSubview:priceLabel];
        priceLabel.textColor = KBLUE;
        priceLabel.attributedText = priceStr;
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
    return CGSizeMake(SCREENWIDTH,SCREENWIDTH *340/750);
    /*if (collectionView == _mainCollectionView) {
        return CGSizeMake(600.0/750*SCREENWIDTH, 340/1334.0*SCREENHEIGHT);
    }else{
        return CGSizeMake((340/1334.0*SCREENHEIGHT - 20)*750/313, 340/1334.0*SCREENHEIGHT - 20);
    }*/
}
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//}
#pragma MARK-- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
    MarketDetailViewController *marketDetailVC = [[MarketDetailViewController alloc]init];
    [self.navigationController pushViewController:marketDetailVC animated:YES];
}
//-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
////    NSLog(@"%f%f",targetContentOffset->x,targetContentOffset->y);
//
//    float pageWidth = pageWidth = scrollView.frame.size.width;
//
//    float currentOffset = scrollView.contentOffset.x;
//    float targetOffset = targetContentOffset->x;
//    float newTargetOffset = 0;
//
//    if (targetOffset > currentOffset)
//        newTargetOffset = ceilf(currentOffset / pageWidth) * pageWidth;
//    else
//        newTargetOffset = floorf(currentOffset / pageWidth) * pageWidth;
//
//    if (newTargetOffset < 0)
//        newTargetOffset = 0;
//    else if (newTargetOffset > scrollView.contentSize.width)
//        newTargetOffset = scrollView.contentSize.width;
//
//    targetContentOffset->x = currentOffset;
//
//    [scrollView setContentOffset:CGPointMake(newTargetOffset, 0) animated:YES];
//
////    NSLog(F(@"%@",@(newTargetOffset)));
//
//}
//-(CGPoint)collectionViewOffSetWithTargetContentOffSet:(CGPoint*)point{
//
//    return CGPointMake(100, 0);
//}
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
