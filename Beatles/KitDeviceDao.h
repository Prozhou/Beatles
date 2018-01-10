//
//  KitDeviceDao.h
//  Beatles
//
//  Created by Zhou Chao on 2017/12/28.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KitDeviceDao : NSObject
+(void)configKitDeviceDataWhenFirstInter;
+(void)fetchKitDeviceWithKitItemName:(NSString *)kitItem success:(void(^)(NSArray *results))success fail:(void(^)(NSError *error))fail;
+(void)deleteKit:(NSString *)kitName deviceName:(NSString *)name success:(void(^)(void))success fail:(void(^)(NSError*error))fail;
+(void)saveKitDevicewithKitName:(NSString*)kitName name:(NSString *)name picName:(NSString *)picName success:(void(^)(void))success fail:(void(^)(NSError*error))fail;
@end
