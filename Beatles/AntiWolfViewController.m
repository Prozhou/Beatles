//
//  AntiWolfViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2018/1/24.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import "AntiWolfViewController.h"

@interface AntiWolfViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    NSArray *normalImageArray;
    NSArray *selectedImageArray;
}

@end

@implementation AntiWolfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    normalImageArray = @[@"自行车标",@"见生人标",@"打夜车标",@"其他标"];
    selectedImageArray = @[@"自行车点亮标",@"见生人标点亮",@"打夜车点亮标",@"其他标点亮"];
    [self rectButton];
    [self rectMainCollectionView];
    [self.protectButtonView setGradientType:leftToRight fromColors:@[KPEACH,KLAKEBLUE]];
}
-(void)rectMainCollectionView{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _mainCollectionView.collectionViewLayout = layout;
    _mainCollectionView.delegate = self;
    [_mainCollectionView registerNib:[UINib nibWithNibName:@"AntiWolfCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"timeCell"];
    
    [_mainCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:1] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 1) {
        return 6;
    }
    return 1;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        NSArray *titleArray = @[@"10分钟",@"30分钟",@"60分钟",@"90分钟",@"120分钟",@"自定义"];
        AntiWolfCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"timeCell" forIndexPath:indexPath];
        cell.tag = indexPath.row;
        cell.timeLabel.text = titleArray[indexPath.row];
        
        if(indexPath.row == 2){
            NSMutableAttributedString *timeStr = [[NSMutableAttributedString alloc]initWithString:cell.timeLabel.text];
            NSRange numRange = NSMakeRange(0, 2);
            NSRange unitRange = NSMakeRange(2, 2);
            [timeStr addAttribute:NSFontAttributeName
                            value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:33]
                            range:numRange];
            [timeStr addAttribute:NSFontAttributeName
                            value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:18]
                            range:unitRange];
            cell.timeLabel.attributedText = timeStr;
            cell.timeLabel.textColor = KORANGE;
        }else{
            NSMutableAttributedString *timeStr = [[NSMutableAttributedString alloc]initWithString:cell.timeLabel.text];
            NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[0-9]+" options:0 error:nil];
            NSArray *matches = [regex matchesInString:cell.timeLabel.text options:0 range:NSMakeRange(0, cell.timeLabel.text.length)];
            for (NSTextCheckingResult *result in [matches objectEnumerator]) {
                NSRange matchRange = [result range];
                [timeStr addAttribute:NSFontAttributeName
                                value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:24]
                                range:matchRange];
            }
            cell.timeLabel.attributedText = timeStr;
        }
        
        
        return cell;
    }else{
        AntiWolfCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"timeCell" forIndexPath:indexPath];
        cell.timeLabel.text = @"";
        return cell;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return CGSizeMake(100,40);
    }
    return CGSizeMake(SCREENWIDTH/2.0 - 50,40);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"--%ld-------%ld",indexPath.section,indexPath.row);
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:(UICollectionViewScrollPositionCenteredHorizontally) animated:YES];
}
-(void)rectButton{
    [self.darkWalkButton addTarget:self action:@selector(selectButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.dateStranger addTarget:self action:@selector(selectButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.taxiButton addTarget:self action:@selector(selectButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.otherButton addTarget:self action:@selector(selectButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)selectButtonClicked:(UIButton *)sender{
    NSLog(@"---%ld----",sender.tag);
    for (UIImageView *imageView in self.selectImageArray) {
        if (imageView.tag == sender.tag) {
            [imageView setImage:[UIImage imageNamed:selectedImageArray[imageView.tag-1]]];
        }else{
            [imageView setImage:[UIImage imageNamed:normalImageArray[imageView.tag-1]]];
        }
    }
    for (UILabel *label in self.selectLabelArray) {
        if (label.tag == sender.tag) {
            label.textColor = KORANGE;
        }else {
            label.textColor = [UIColor darkGrayColor];
        }
    }
}
-(CGPoint)collectionView:(UICollectionView *)collectionView targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset{
    NSLog(@"%lf",proposedContentOffset.x);
    return proposedContentOffset;
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    CGFloat dis = CGFLOAT_MAX;
    CGFloat desCenterX = CGFLOAT_MIN;
    for (int i = 0; i < 6; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:1];
        UICollectionViewLayoutAttributes *attributes = [self.mainCollectionView.collectionViewLayout layoutAttributesForItemAtIndexPath:indexPath];
        if (attributes && fabs(attributes.center.x - (targetContentOffset->x) - SCREENWIDTH / 2.0) < dis) {
            dis = fabs(attributes.center.x - (targetContentOffset->x) - SCREENWIDTH / 2.0);
            desCenterX = attributes.center.x;
        }
    }
    *targetContentOffset = CGPointMake((desCenterX - SCREENWIDTH / 2), 0);
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self changeTimeLabelState];
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self changeTimeLabelState];
}
-(void)changeTimeLabelState{
    for (int i = 0; i < 6; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:1];
        AntiWolfCollectionViewCell *cell = (AntiWolfCollectionViewCell*)[self.mainCollectionView cellForItemAtIndexPath:indexPath];
        CGFloat pointInSvreen = cell.center.x - self.mainCollectionView.contentOffset.x;
        if (fabs(pointInSvreen - SCREENWIDTH / 2) < 5) {
            if (cell.tag <5) {
                NSRange unitRange = [cell.timeLabel.text rangeOfString:@"分钟"];
                NSRange numRange = [cell.timeLabel.text rangeOfString:@"[0-9]*" options:NSRegularExpressionSearch];
                NSMutableAttributedString *labelStr = [[NSMutableAttributedString alloc] initWithString:cell.timeLabel.text];
                [labelStr addAttribute:NSFontAttributeName
                                value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:33]
                                range:numRange];
                [labelStr addAttribute:NSFontAttributeName
                                value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:18]
                                range:unitRange];
                cell.timeLabel.textColor = KORANGE;
                cell.timeLabel.attributedText = labelStr;
            }else{
                cell.timeLabel.textColor = KORANGE;
                cell.timeLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:33];
            }
        }else{
            if (cell && cell.tag <5) {
                NSRange unitRange = [cell.timeLabel.text rangeOfString:@"分钟"];
                NSRange numRange = [cell.timeLabel.text rangeOfString:@"[0-9]*" options:NSRegularExpressionSearch];
                NSMutableAttributedString *labelStr = [[NSMutableAttributedString alloc] initWithString:cell.timeLabel.text];
                [labelStr addAttribute:NSFontAttributeName
                                 value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:24]
                                 range:numRange];
                [labelStr addAttribute:NSFontAttributeName
                                 value:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:15]
                                 range:unitRange];
                cell.timeLabel.textColor = [UIColor darkGrayColor];
                cell.timeLabel.attributedText = labelStr;
            }else if(cell && cell.tag ==5){
                cell.timeLabel.textColor = [UIColor darkGrayColor];
                cell.timeLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Normal" size:24];
            }
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
