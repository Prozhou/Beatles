//
//  TestViewController.m
//  Beatles
//
//  Created by Zhou Chao on 2017/12/19.
//  Copyright © 2017年 xiran. All rights reserved.
//

#import "TestViewController.h"
#import "User+CoreDataClass.h"
#import "User+CoreDataProperties.h"
#import "BaseDao.h"
@interface TestViewController ()
@property(nonatomic,strong)NSManagedObjectContext *context;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test6];
}
-(void)test6{
    [JDStatusBarNotification showWithStatus:@"1234" dismissAfter:2 styleName:JDStatusBarStyleError];
}
-(void)addItem{
    BaseDao *dao = [BaseDao shareInstance];
    NSDictionary *dic = @{@"name":@"tiffy",@"age":[NSNumber numberWithInt:18],@"gender":[NSNumber numberWithInt:0]};
    [dao saveEntityDic:dic entityName:@"User" success:^{
        NSLog(@"成功");
    } fail:^(NSError *error) {
        NSLog(@"失败");
    }];
}
-(void)fetchItem{
    BaseDao *dao = [BaseDao shareInstance];
    NSDictionary *dic = @{@"name":@"tiffy"};
//    NSDictionary *dic = @{@"age":[NSNumber numberWithInt:18]};
    [dao fetchEntityWithName:@"User" withSequence:nil ascending:false predicateDic:dic success:^(NSArray *results) {
        NSLog(@"成功");
        for (User *user in results) {
            NSLog(@"user.age==%d",user.age);
        }
    } fail:^(NSError *error) {
        NSLog(@"失败");
    }];
}
-(void)deleteItem{
    BaseDao *dao = [BaseDao shareInstance];
    NSDictionary *dic = @{@"name":@"tiffy"};
    [dao fetchEntityWithName:@"User" withSequence:nil ascending:false predicateDic:dic success:^(NSArray *results) {
        NSLog(@"成功");
        for (User *user in results) {
            NSLog(@"user.name==%@",user.name);
            [dao deleteEntity:user withName:@"User" success:^{
                NSLog(@"成功删除");
            } fail:^(NSError *error) {
                NSLog(@"删除失败");
            }];
        }
    } fail:^(NSError *error) {
        NSLog(@"失败");
    }];
}
-(void)updataItem{
    BaseDao *dao = [BaseDao shareInstance];
    NSDictionary *dic = @{@"name":@"tiffy"};
    [dao fetchEntityWithName:@"User" withSequence:nil ascending:false predicateDic:dic success:^(NSArray *results) {
        NSLog(@"成功");
        for (User *user in results) {
            NSLog(@"user.name==%@",user.name);
            user.age = 17;
            [dao updateEntitySuccess:^{
                NSLog(@"修改成功");
            } fail:^(NSError *error) {
                NSLog(@"修改失败");
            }];
        }
    } fail:^(NSError *error) {
        NSLog(@"失败");
    }];
}

-(void)addData{
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:_context];
    user.userId = 1;
    user.name = @"jack";
    user.pwd = @"123";
    user.gender = 1;
    user.age = 17;
    NSError *error = nil;
    [_context save:&error];
    if (error) {
        NSLog(@"%@",error.userInfo);
    }
    else{
        NSLog(@"save success");
    }
}
-(void)deleteData{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"gender=1"];
    request.predicate = pre;
    NSArray *deleArray = [_context executeFetchRequest:request error:nil];
    for (User *user in deleArray) {
        NSLog(@"username--%@",user.name);
        [_context deleteObject:user];
    }
    NSError *error = nil;
    [_context save:&error];
    if (error) {
        NSLog(@"delete failed");
    }else{
        NSLog(@"delete success");
    }
}
-(void)updateData{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"gender=1"];
    request.predicate = pre;
    NSArray *resArray = [_context executeFetchRequest:request error:nil];
    for (User *user in resArray) {
        NSLog(@"username--%@",user.name);
        user.gender = 4;
    }
    NSError *error = nil;
    [_context save:&error];
    if (error) {
        NSLog(@"update failed");
    }else{
        NSLog(@"update success");
    }
}
-(void)queryData{
    
}
-(void)test5{
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
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
    //关联持久化处理
    [context setPersistentStoreCoordinator:store];
    _context = context;
}
-(void)test4{
    //创建label
    self.label = [UILabel new];
    self.label.numberOfLines = 0;
    self.label.lineBreakMode = NSLineBreakByTruncatingTail;
    self.label.text = @"有的人，没事时喜欢在朋友圈里到处点赞，东评论一句西评论一句，比谁都有存在感。等你有事找他了，他就立刻变得很忙，让你再也找不着。真正的朋友，平常很少联系。可一旦你遇上了难处，他会立刻回复你的消息，第一时间站出来帮你。所谓的存在感，不是你有没有出现，而是你的出现有没有价值。存在感，不是刷出来的，也不是说出来的。有存在感，未必是要个性锋芒毕露、甚至锋利扎人。翩翩君子，温润如玉，真正有存在感的人，反而不会刻意去强调他的存在感。他的出现，永远都恰到好处。我所欣赏的存在感，不是长袖善舞巧言令色，而是对他人的真心关照；不是锋芒毕露计较胜负，而是让人相处得舒服；不是时时刻刻聒噪不休，而是关键时刻能挺身而出。别总急着出风头，希望你能有恰到好处的存在感。";
    [self.view addSubview:self.label];
    
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(10);
        make.right.equalTo(-10);
    }];
    
}
-(void)test3{
    __weak typeof (self) weakSelf = self;
    UIView *view1 = [[UIButton alloc]init];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(90, 150));
        make.centerX.equalTo(weakSelf.view);
        make.top.offset(90);
    }];
}
-(void)test2{
    __weak typeof (self) weakSelf = self;
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
        make.edges.mas_offset(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}
-(void)test1{
    __weak typeof (self) weakSelf = self;
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
