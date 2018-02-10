//
//  MyDeviceViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2018/2/7.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "MyDeviceViewController.h"

@interface MyDeviceViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@end

@implementation MyDeviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.boardCollectionView.backgroundColor = RGBA(105, 110, 117, 1);
    [self.backBtn setBackgroundColor:[UIColor whiteColor]];
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
    [self.navigationController popViewControllerAnimated:YES];
}
-(UICollectionView *)boardCollectionView{
    if (!_boardCollectionView) {
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        layout.sectionHeadersPinToVisibleBounds = YES;
        layout.minimumLineSpacing = 2;
        layout.minimumInteritemSpacing = 2;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.headerReferenceSize = CGSizeMake(SCREENWIDTH, 40);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _boardCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        [self.mainScrollView addSubview:_boardCollectionView];
        _boardCollectionView.showsHorizontalScrollIndicator = false;
        _boardCollectionView.delegate=self;
        _boardCollectionView.dataSource=self;
        [_boardCollectionView registerNib:[UINib nibWithNibName:@"MyDeviceItemCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"itemCell"];
        [_boardCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        _boardCollectionView.frame = CGRectMake(0, 0, SCREENWIDTH, _mainScrollView.frame.size.height);
    }
    return _boardCollectionView;
}
#pragma MARK-- UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
    }else{
        return 5;
    }
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *nameArray = @[@[@"遥控器",@"防狼"],@[@"游戏手柄",@"无损播放",@"神秘单品",@"神秘单品",@"神秘单品"]];
    NSArray *picArray = @[@[@"设备1",@"设备2"],@[@"设备3",@"设备4",@"设备5",@"设备6",@"设备7"]];
    UICollectionViewCell *cell = nil;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"itemCell" forIndexPath:indexPath];
    MyDeviceItemCollectionViewCell *proCell = (MyDeviceItemCollectionViewCell *)cell;
    proCell.proImageView.image = [UIImage imageNamed:picArray[indexPath.section][indexPath.row]];
    proCell.nameLabel.text = nameArray[indexPath.section][indexPath.row];
    if (indexPath.section == 0) {
        proCell.stateLabel.text = @"设备运作正常";
        proCell.stateLabel.textColor = KORANGE;
    }else if (indexPath.section == 1) {
        proCell.stateLabel.text = @"设备停止运作";
        proCell.stateLabel.textColor =RGBA(116, 116, 116, 1);
    }
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    NSArray *titleArray = @[@"在线设备",@"离线设备"];
    UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    for (UIView *sub in header.subviews) {
        [sub removeFromSuperview];
    }
    header.backgroundColor=[UIColor whiteColor];
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(38, 12, 200, 22)];
    titleLable.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:18];
    titleLable.text = titleArray[indexPath.section];
    [header addSubview:titleLable];
    
    
    UIView *sepView = [[UIView alloc]initWithFrame:CGRectMake(0, 39.5, SCREENWIDTH, 0.5)];
    sepView.backgroundColor = RGBA(126, 126, 126, 1);
    [header addSubview:sepView];
    
    UIImageView *addImage = [[UIImageView alloc]init];
    [header addSubview:addImage];
    [addImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(9, 9));
        make.centerY.equalTo(header).offset(3);
        make.right.equalTo(header).offset(-38);
    }];
    
    
    if (indexPath.section == 0) {
        titleLable.textColor = KORANGE;
        addImage.image = [UIImage imageNamed:@"加号"];
    }else{
        UIView *sepView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 0.5)];
        sepView.backgroundColor = RGBA(126, 126, 126, 1);
        [header addSubview:sepView];
        addImage.image = [UIImage imageNamed:@"加号灰"];
        titleLable.textColor = [UIColor blackColor];
    }
    return header;
}
#pragma MARK-- UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((SCREENWIDTH-20)/3, 269/235*((SCREENWIDTH-20)/3));
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(8, 8, 8, 8);
}
#pragma MARK-- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
