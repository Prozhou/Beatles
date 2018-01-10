//
//  ConfigDataTool.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/27.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "ConfigDataTool.h"

@implementation ConfigDataTool
+(void)configKitDataWhenFirstInter{
    NSLog(@"配置kit信息");
    BaseDao *dao = [BaseDao shareInstance];
    NSArray *kitItemArray = @[@"旅游",@"出差",@"居家",@"运动"];
    for (NSString *kitName in kitItemArray) {
        [dao saveEntityDic:@{@"name":kitName} entityName:@"KitItem" success:^{
            NSLog(@"%@添加成功",kitName);
        } fail:^(NSError *error) {
            NSLog(@"kit添加失败");
        }];
    }
}
+(void)fetchAllKitItemSuccess:(void(^)(NSArray *results))success fail:(void(^)(NSError *error))fail{
    BaseDao *dao = [BaseDao shareInstance];
    [dao fetchEntityWithName:@"KitItem" withSequence:nil ascending:nil predicateDic:nil success:^(NSArray *results) {
        success(results);
    } fail:^(NSError *error) {
        fail(error);
    }];
}
@end
