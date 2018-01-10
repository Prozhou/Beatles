//
//  ConfigDataTool.h
//  Beatles
//
//  Created by Zhou Chao on 2017/12/27.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConfigDataTool : NSObject
+(void)configKitDataWhenFirstInter;
+(void)fetchAllKitItemSuccess:(void(^)(NSArray *results))success fail:(void(^)(NSError *error))fail;
@end
