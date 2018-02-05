//
//  AntiWolfViewController.h
//  Beatles
//
//  Created by Zhou Chao on 2018/1/24.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AntiWolfViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *darkWalkButton;
@property (weak, nonatomic) IBOutlet UIButton *dateStranger;
@property (weak, nonatomic) IBOutlet UIButton *taxiButton;
@property (weak, nonatomic) IBOutlet UIButton *otherButton;
@property (weak, nonatomic) IBOutlet UIButton *protectButtonView;

@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *selectImageArray;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *selectLabelArray;

@end
