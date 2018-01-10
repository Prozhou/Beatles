//
//  AppDelegate.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/14.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<AMapLocationManagerDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    TestViewController *testVC = [[TestViewController alloc]init];
    BaseTabBarController *tabBar = [[BaseTabBarController alloc]init];
    LoginViewController *login = [[LoginViewController alloc]init];
    [self.window setRootViewController:login];
    [self configInitData];
    
    /*map*/
    [AMapServices sharedServices].apiKey = @"33d2a16ae8a4f7899f2baf72913ea47a";
    self.locationManager = [[AMapLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    return YES;
}
-(void)configInitData{
    if ([ConfigDao hasConfig:@"first"]) {
        NSLog(@"不是第一次进入");
    }else{
        NSLog(@"第一次进入");
        [ConfigDao setConfig:@"first" withValue:@"1"];
        [ConfigDataTool configKitDataWhenFirstInter];
        [MyDeviceDao configMyDeviceDataWhenFirstInter];
        [KitDeviceDao configKitDeviceDataWhenFirstInter];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode
{
    NSLog(@"location:{lat:%f; lon:%f; accuracy:%f}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy);
    if (reGeocode)
    {
        NSLog(@"reGeocode:%@", reGeocode);
    }
}
@end
