//
//  NothingViewController.h
//  Beatles
//
//  Created by Zhou Chao on 2018/1/26.
//  Copyright © 2018年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  NS_ENUM(NSInteger,NoThingType){
    NothingType1 = 0,
    NothingType2
};
@interface NothingViewController : UIViewController
@property(nonatomic,assign)NoThingType *nothingType;
@property(nonatomic,strong)UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIImageView *rabbitImage;
@property (weak, nonatomic) IBOutlet UILabel *rabbitLabel;

@property (weak, nonatomic) IBOutlet UIImageView *manImageView;
@property (weak, nonatomic) IBOutlet UILabel *manLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSep;

@end
