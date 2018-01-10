//
//  ConfigDao.h
//  Beatles
//
//  Created by Zhou Chao on 2017/12/27.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConfigDao : NSObject
+(BOOL)hasConfig:(NSString *)configName;
+(void)setConfig:(NSString *)configName withValue:(id)value;
@end
