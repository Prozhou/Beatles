//
//  SettingViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/22.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.topView setBackgroundColor:[UIColor clearColor]];
    [self.leftView setBackgroundColor:[UIColor clearColor]];
    [self.rightView setBackgroundColor:[UIColor clearColor]];
}
-(UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc]init];
        [self.view addSubview:_topView];
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(SCREENWIDTH, 280.0/1334*SCREENHEIGHT));
            make.top.left.equalTo(self.view);
        }];
        self.titleLabel.backgroundColor = [UIColor clearColor];
    }
    return _topView;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text=@"功能设置";
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:24];
        _titleLabel.textColor = KBLUE2;
        [_topView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_centerX).offset(30);
//            make.left.equalTo(_topView.mas_centerX);
            make.size.equalTo(CGSizeMake(SCREENWIDTH/2, 30));
            make.bottom.equalTo(_topView).offset(-10);
        }];
    }
    return _titleLabel;
}
-(UIView *)leftView{
    if (!_leftView) {
        _leftView = [[UIView alloc]init];
        [self.view addSubview:_leftView];
        [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_topView.mas_bottom);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view.mas_centerX);
            make.bottom.equalTo(self.view).offset(-49);
        }];
        self.imageView.backgroundColor = [UIColor clearColor];
        
    }
    return _leftView;
}
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        [_imageView setImage:[UIImage imageNamed:@"设置界面面板"]];
        [_leftView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_leftView.mas_top).offset(20);
            make.left.equalTo(_leftView.mas_left).offset(15);
            make.right.equalTo(_leftView.mas_right).offset(-10);
            make.height.equalTo(_imageView.mas_width).multipliedBy(600.0/338);
        }];
    }
    return _imageView;
}
-(UIView *)rightView{
    if (!_rightView) {
        _rightView = [[UIView alloc]init];
        [self.view addSubview:_rightView];
        [_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_topView.mas_bottom);
            make.left.equalTo(_leftView.mas_right);
            make.right.equalTo(self.view.mas_right);
            make.bottom.equalTo(self.view).offset(-49);
        }];
        [self.settingCollectionView setBackgroundColor:[UIColor clearColor]];
    }
    return _rightView;
}
-(UICollectionView *)settingCollectionView{
    if (!_settingCollectionView) {
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _settingCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _settingCollectionView.showsVerticalScrollIndicator = false;
        _settingCollectionView.delegate=self;
        _settingCollectionView.dataSource=self;
        [_rightView addSubview:_settingCollectionView];
        [_settingCollectionView registerClass:[SettingItemTextCollectionViewCell class] forCellWithReuseIdentifier:@"settingTextCellId"];
        
        [_settingCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_rightView.mas_top);
            make.left.equalTo(_rightView.mas_left).offset(30);
            make.right.equalTo(_rightView.mas_right).offset(-36);
            make.bottom.equalTo(_rightView.mas_bottom).offset(-50);
        }];
    }
    return _settingCollectionView;
}
#pragma MARK-- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *titleArray = @[@"大小尺寸",@"颜色",@"使用习惯",@"灯光",@"省电"];
    SettingItemTextCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"settingTextCellId" forIndexPath:indexPath];
    cell.titleLabel.text = titleArray[indexPath.row];
    cell.titleLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:15];
    cell.titleLabel.textColor = KBLUE2;
    return cell;
}
/*
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    KitSettingCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"settingHeaderId" forIndexPath:indexPath];
    return headerView;
}*/
#pragma MARK-- UICollectionViewDelegateFlowLayout
/*
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(80, 50);
}*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(_settingCollectionView.frame.size.width,35);
}
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//}
#pragma MARK-- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            {
                
            }
            break;
        case 1:
            {
                
            }
            break;
        case 2:
            {
                
            }
            break;
        case 3:
            {
                SettingLocalMapViewController *mapVC = [[SettingLocalMapViewController alloc]init];
                [self.navigationController pushViewController:mapVC animated:YES];
            }
            break;
        case 4:
            {
                
            }
            break;
        default:
            break;
    }
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
