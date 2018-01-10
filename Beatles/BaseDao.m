//
//  BaseDao.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/26.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "BaseDao.h"
#import "User+CoreDataClass.h"
#import "User+CoreDataProperties.h"
static BaseDao *_instance;
@implementation BaseDao
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    @synchronized (self) {
        if (!_instance) {
            _instance = [super allocWithZone:zone];
        }
    }
    return _instance;
}
+(instancetype)shareInstance{
    return [[self alloc] init];
}
-(instancetype)init{
    //创建模型对象
    NSURL *modelURL = [[NSBundle mainBundle]URLForResource:@"TestModel" withExtension:@"momd"];
    NSManagedObjectModel  *model = [[NSManagedObjectModel alloc]initWithContentsOfURL:modelURL];
    //创建持久化助理
    NSPersistentStoreCoordinator *store = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:model];
    //数据库的名称和路径
    NSString *docStr = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *sqlPath = [docStr stringByAppendingPathComponent:@"testSqlite.sqlite"];
    NSLog(@"%@",sqlPath);
    [store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:sqlPath] options:nil error:nil];
    //创建上下文
    self.context = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
    //关联持久化处理
    [self.context setPersistentStoreCoordinator:store];
    return _instance;
}
-(void)saveEntityDic:(NSDictionary *)dic entityName:(NSString *)entityName success:(void(^)(void))success fail:(void(^)(NSError *error))fail{
    if (!dic||dic.allKeys.count == 0) return;
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:self.context];
    for (NSString *key in dic.allKeys) {
        [object setValue:dic[key] forKey:key];
    }
    NSError *error = nil;
    [self.context save:&error];
    if (error) {
        fail(error);
    }
    else{
        success();
    }
}
-(void)deleteEntity:(NSManagedObject *)entity withName:(NSString *)entityName success:(void(^)(void))success fail:(void(^)(NSError *error))fail{
    [self.context deleteObject:entity];
    NSError *error = nil;
    [self.context save:&error];
    if (error) {
        fail(error);
    }else{
        success();
    }
}

- (void)fetchEntityWithName:(NSString *)entityName withSequence:(NSArray *)sequenceKeys ascending:(BOOL)isAscending predicateDic:(NSDictionary *)filterDic success:(void(^)(NSArray *results))success fail:(void(^)(NSError *error))fail
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *desc = [NSEntityDescription entityForName:entityName inManagedObjectContext:self.context];
    request.entity = desc;
    // 3.设置查询结果排序
    if (sequenceKeys && sequenceKeys.count>0) { // 如果进行了设置排序
        NSMutableArray *array = [NSMutableArray array];
        for (NSString *key in sequenceKeys) {
            /**
             *  设置查询结果排序
             *  sequenceKey:根据某个属性（相当于数据库某个字段）来排序
             *  isAscending:是否升序
             */
            NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:key ascending:isAscending];
            [array addObject:sort];
        }
        if (array.count>0) {
            request.sortDescriptors = array;// 可以添加多个排序描述器，然后按顺序放进数组即可
        }
    }
    // 4.设置条件过滤
    if (filterDic) { // 如果设置了过滤语句
        NSString *preString = [NSString string];
        for (NSString *key in filterDic.allKeys) {
            if ([filterDic[key] isKindOfClass:[NSString class]]) {
                preString = [preString stringByAppendingString:[NSString stringWithFormat:@"%@='%@' && ",key,filterDic[key]]];
            }else{
                preString = [preString stringByAppendingString:[NSString stringWithFormat:@"%@=%@ && ",key,filterDic[key]]];
            }
        }
        preString = [preString stringByAppendingString:@"1 = 1"];
        NSPredicate *pre = [NSPredicate predicateWithFormat:preString];
        request.predicate = pre;
    }
    // 5.执行请求
    NSError *error = nil;
    NSArray *fetchObject = [self.context executeFetchRequest:request error:&error]; // 获得查询数据数据集合
    if (error) {
        fail(error);
    } else{
        success(fetchObject);
    }
}


-(void)updateEntitySuccess:(void(^)(void))success fail:(void(^)(NSError *error))fail {
    
    NSError *error = nil;
    [self.context save:&error];
    if (error) {
        fail(error);
    } else {
        success();
    }
}
//同步添加方法
-(void)saveEntityDic:(NSDictionary *)dic entityName:(NSString *)entityName{
    if (!dic||dic.allKeys.count == 0) return;
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:self.context];
    for (NSString *key in dic.allKeys) {
        [object setValue:dic[key] forKey:key];
    }
    NSError *error = nil;
    [self.context save:&error];
    if (error) {
        NSLog(@"---同步增加成功");
    }
    else{
        NSLog(@"--同步增加失败");
    }
}
//同步删除
-(void)deleteEntity:(NSManagedObject *)entity withName:(NSString *)entityName {
    [self.context deleteObject:entity];
    NSError *error = nil;
    [self.context save:&error];
    if (error) {
        NSLog(@"--同步删除失败");
    }else{
        NSLog(@"--同步删除成功");
    }
}
//同步更新
-(void)updateEntity {
    
    NSError *error = nil;
    [self.context save:&error];
    if (error) {
        NSLog(@"--同步更新失败");
    } else {
        NSLog(@"--同步更新失败");
    }
}
//同步查询
- (NSArray *)fetchEntityWithName:(NSString *)entityName withSequence:(NSArray *)sequenceKeys ascending:(BOOL)isAscending predicateDic:(NSDictionary *)filterDic
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *desc = [NSEntityDescription entityForName:entityName inManagedObjectContext:self.context];
    request.entity = desc;
    // 3.设置查询结果排序
    if (sequenceKeys && sequenceKeys.count>0) { // 如果进行了设置排序
        NSMutableArray *array = [NSMutableArray array];
        for (NSString *key in sequenceKeys) {
            /**
             *  设置查询结果排序
             *  sequenceKey:根据某个属性（相当于数据库某个字段）来排序
             *  isAscending:是否升序
             */
            NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:key ascending:isAscending];
            [array addObject:sort];
        }
        if (array.count>0) {
            request.sortDescriptors = array;// 可以添加多个排序描述器，然后按顺序放进数组即可
        }
    }
    // 4.设置条件过滤
    if (filterDic) { // 如果设置了过滤语句
        NSString *preString = [NSString string];
        for (NSString *key in filterDic.allKeys) {
            if ([filterDic[key] isKindOfClass:[NSString class]]) {
                preString = [preString stringByAppendingString:[NSString stringWithFormat:@"%@='%@' && ",key,filterDic[key]]];
            }else{
                preString = [preString stringByAppendingString:[NSString stringWithFormat:@"%@=%@ && ",key,filterDic[key]]];
            }
        }
        preString = [preString stringByAppendingString:@"1 = 1"];
        NSPredicate *pre = [NSPredicate predicateWithFormat:preString];
        request.predicate = pre;
    }
    // 5.执行请求
    NSError *error = nil;
    NSArray *fetchObject = [self.context executeFetchRequest:request error:&error]; // 获得查询数据数据集合
    if (error) {
        NSLog(@"---同步查询失败");
        return nil;
    } else{
        NSLog(@"---同步查询成功");
        return fetchObject;
    }
}

-(NSManagedObject *)fetchById:(int)Id{
    return nil;
}

@end
