//
//  KitDeviceDao.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/28.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "KitDeviceDao.h"

@implementation KitDeviceDao
+(void)configKitDeviceDataWhenFirstInter{
    NSLog(@"配置kitDevice信息");
    BaseDao *dao = [BaseDao shareInstance];
    NSDictionary *kitDic = @{@"旅游":@{@"设备1":@"商城产品1",@"设备2":@"商城产品2",@"设备3":@"商城产品3"},@"出差":@{@"设备2":@"商城产品2",@"设备3":@"商城产品3"},@"居家":@{@"设备3":@"商城产品3",@"设备1":@"商城产品1"},@"运动":@{@"设备2":@"商城产品2"}};
    for (NSString *kitName in kitDic.allKeys) {
        NSDictionary *deviceDic = kitDic[kitName];
        for (NSString *deviceName in deviceDic.allKeys) {
            [dao saveEntityDic:@{@"kitName":kitName,@"name":deviceName,@"picName":deviceDic[deviceName]} entityName:@"KitDevice" success:^{
                NSLog(@"%@添加成功",kitName);
            } fail:^(NSError *error) {
                NSLog(@"%@添加失败",kitName);
            }];
        }
    }
}
+(void)fetchKitDeviceWithKitItemName:(NSString *)kitItem success:(void(^)(NSArray *results))success fail:(void(^)(NSError *error))fail{
    BaseDao *dao = [BaseDao shareInstance];
    NSDictionary *dic = nil;
    if (kitItem != nil && ![kitItem  isEqual: @""]) {
        dic = @{@"kitName":kitItem};
    }
    [dao fetchEntityWithName:@"KitDevice" withSequence:nil ascending:nil predicateDic:dic success:^(NSArray *results) {
        success(results);
    } fail:^(NSError *error) {
        fail(error);
    }];
}
+(void)deleteKit:(NSString *)kitName deviceName:(NSString *)name success:(void(^)(void))success fail:(void(^)(NSError*error))fail{
    BaseDao *dao = [BaseDao shareInstance];
    [dao fetchEntityWithName:@"KitDevice" withSequence:nil ascending:nil predicateDic:@{@"kitName":kitName,@"name":name} success:^(NSArray *results) {
        KitDevice *device = (KitDevice *)results.lastObject;
        [dao deleteEntity:device withName:@"KitDevice" success:^{
            NSLog(@"删除kitDevice成功");
            success();
        } fail:^(NSError *error) {
            NSLog(@"删除kitDevice失败");
            fail(error);
        }];
    } fail:^(NSError *error) {
        
    }];
}
+(void)saveKitDevicewithKitName:(NSString*)kitName name:(NSString *)name picName:(NSString *)picName success:(void(^)(void))success fail:(void(^)(NSError*error))fail{
    BaseDao *dao = [BaseDao shareInstance];
    [dao saveEntityDic:@{@"name":name,@"kitName":kitName,@"picName":picName} entityName:@"KitDevice" success:^{
        NSLog(@"添加kitDevice成功");
        success();
    } fail:^(NSError *error) {
        NSLog(@"添加kitDevice失败");
        fail(error);
    }];
}




@end
