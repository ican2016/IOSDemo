//
//  CarTool.m
//  03－FMDB使用
//
//  Created by Apple-JF on 15/10/5.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "CarTool.h"
#import "FMDB.h"
#import "Car.h"
@interface CarTool()

@end

@implementation CarTool

// 只用CarTool类访问这个属性
static FMDatabaseQueue *queueDB; // FMDatabaseQueue  创建的数据对象是线程安全的

+ (void)initialize
{
    // 获取数据文件
    NSString *fileName = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:@"car.sqlite"];
    
    // 创建数据库对象实例
    queueDB = [FMDatabaseQueue databaseQueueWithPath:fileName];
    
    // 创建表
    [queueDB inDatabase:^(FMDatabase *db) {
        // 打开事物
        [db beginTransaction];
        BOOL result = [db executeUpdate:@"create table if not exists car(id integer primary key AUTOINCREMENT,color text);"];
        if (!result) {
            NSLog(@"创建表失败");
        }
        // 事物回滚
        [db rollback];
        
        // 提交事物
        [db commit];
    }];
    
}

+ (BOOL)addCar:(Car *)car
{
    __block BOOL result;
    [queueDB inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:@"insert into car(color)values(?)",car.color];
        if (!result) {
            NSLog(@"添加数据失败");
        }
    }];
    
    return result;
}

+ (BOOL)deleteCar:(int)ID
{
    __block BOOL result;
    [queueDB inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:@"delete from car where id = ?",ID];
        if (!result) {
            NSLog(@"删除数据失败");
        }
    }];
    
    return result;
}

+ (BOOL)updateCar:(Car *)car
{
    __block BOOL result;
    [queueDB inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:@"update car set color = ? where id = ?",car.color,car.ID];
        if (!result) {
            NSLog(@"更新数据失败");
        }
    }];
  
    return result;
}

+ (NSArray *)queryCar
{
      __block NSMutableArray *carArray = [NSMutableArray array];
    
    [queueDB inDatabase:^(FMDatabase *db) {
        FMResultSet * result = [db executeQuery:@"select * from car"];
      
        while (result.next) {
            Car *car = [[Car alloc]init];
            [car setID:[result intForColumn:@"ID"]];
            [car setColor:[result stringForColumn:@"color"]];
            
            [carArray addObject:car];
        }
    
    }];
    return carArray;
}

+ (NSArray *)queryCarByCondition:(int) ID
{
    
    __block NSMutableArray *carArray = [NSMutableArray array];
    
    [queueDB inDatabase:^(FMDatabase *db) {
        FMResultSet * result = [db executeQuery:@"select * from car where id like ?",ID];
        while (result.next) {
            Car *car = [[Car alloc]init];
            [car setID:[result intForColumn:@"ID"]];
            [car setColor:[result stringForColumn:@"color"]];
            
            [carArray addObject:car];
        }
        
    }];

    return carArray;
}

@end
