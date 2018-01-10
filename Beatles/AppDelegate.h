//
//  AppDelegate.h
//  Beatles
//
//  Created by Zhou Chao on 2017/12/14.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong)AMapLocationManager *locationManager;

@end

