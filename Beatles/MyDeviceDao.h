//
//  MyDeviceDao.h
//  Beatles
//
//  Created by Zhou Chao on 2017/12/28.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDeviceDao : NSObject
+(void)configMyDeviceDataWhenFirstInter;
+(void)fetchAllMyDeviceSuccess:(void(^)(NSArray *results))success fail:(void(^)(NSError *error))fail;
@end
