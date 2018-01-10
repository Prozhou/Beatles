//
//  MyDeviceDao.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/28.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "MyDeviceDao.h"

@implementation MyDeviceDao
+(void)configMyDeviceDataWhenFirstInter{
    NSLog(@"配置MyDevice信息");
    BaseDao *dao = [BaseDao shareInstance];
    NSDictionary *deviceDic = @{@"设备1":@"商城产品1",@"设备2":@"商城产品2",@"设备3":@"商城产品3"};
    for (NSString *deviceName in deviceDic.allKeys) {
        [dao saveEntityDic:@{@"name":deviceName,@"picName":deviceDic[deviceName]} entityName:@"MyDevice" success:^{
            NSLog(@"%@添加成功",deviceName);
        } fail:^(NSError *error) {
            NSLog(@"%@添加失败",deviceName);
        }];
    }
}
+(void)fetchAllMyDeviceSuccess:(void(^)(NSArray *results))success fail:(void(^)(NSError *error))fail{
    BaseDao *dao = [BaseDao shareInstance];
    
    [dao fetchEntityWithName:@"MyDevice" withSequence:nil ascending:nil predicateDic:nil success:^(NSArray *results) {
        
        success(results);
    } fail:^(NSError *error) {
        fail(error);
    }];
}

@end










