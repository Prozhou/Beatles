//
//  BaseDao.h
//  Beatles
//
//  Created by Zhou Chao on 2017/12/26.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseDao : NSObject
@property(nonatomic,strong)NSManagedObjectContext *context;
+(instancetype)shareInstance;
-(void)saveEntityDic:(NSDictionary *)dic entityName:(NSString *)entityName success:(void(^)(void))success fail:(void(^)(NSError *error))fail;
-(void)deleteEntity:(NSManagedObject *)entity withName:(NSString *)entityName success:(void(^)(void))success fail:(void(^)(NSError *error))fail;
- (void)fetchEntityWithName:(NSString *)entityName withSequence:(NSArray *)sequenceKeys ascending:(BOOL)isAscending predicateDic:(NSDictionary *)filterDic success:(void(^)(NSArray *results))success fail:(void(^)(NSError *error))fail;
-(void)updateEntitySuccess:(void(^)(void))success fail:(void(^)(NSError *error))fail;
//同步方法；
-(void)saveEntityDic:(NSDictionary *)dic entityName:(NSString *)entityName;
-(void)deleteEntity:(NSManagedObject *)entity withName:(NSString *)entityName;
-(void)updateEntity;
- (NSArray *)fetchEntityWithName:(NSString *)entityName withSequence:(NSArray *)sequenceKeys ascending:(BOOL)isAscending predicateDic:(NSDictionary *)filterDic;
@end
