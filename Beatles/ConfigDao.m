//
//  ConfigDao.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/27.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "ConfigDao.h"
#import "Config+CoreDataClass.h"
#import "Config+CoreDataProperties.h"

@implementation ConfigDao
+(BOOL)hasConfig:(NSString *)configName{
    BaseDao *dao = [BaseDao shareInstance];
    NSDictionary *dic = [NSDictionary dictionaryWithObject:configName forKey:@"name"];
    NSArray *fetchArray =  [dao fetchEntityWithName:@"Config" withSequence:nil ascending:nil predicateDic:dic];
    if (fetchArray.count>0) {
        return true;
    }else{
        return false;
    }
}
+(void)setConfig:(NSString *)configName withValue:(id)value{
    BaseDao *dao = [BaseDao shareInstance];
    if([self hasConfig:configName]){
        NSDictionary *dic = [NSDictionary dictionaryWithObject:configName forKey:@"name"];
        [dao fetchEntityWithName:@"Config" withSequence:nil ascending:nil predicateDic:dic success:^(NSArray *results) {
            Config *config = results.lastObject;
            config.value = value;
        } fail:^(NSError *error) {
            NSLog(@"---%@",error.userInfo);
        }];
    }else{
        NSDictionary *dic = @{@"name":configName,@"value":value};
        [dao saveEntityDic:dic entityName:@"Config" success:^{
            NSLog(@"config配置成功");
        } fail:^(NSError *error) {
            NSLog(@"config配置失败");
        }];
    }
}
@end

