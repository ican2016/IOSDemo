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
static FMDatabase *_db;
+ (void)initialize
{
    NSString *fileName = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:@"car.sqlite"];
    
    _db = [FMDatabase databaseWithPath:fileName];
    
    if ([_db open]) {
        BOOL result = [_db executeUpdate:@"create table if not exists car(id integer primary key AUTOINCREMENT,color text);"];
        if (!result) {
            NSLog(@"创建表失败");
        }
    }else{
         NSLog(@"数据库打开失败");
    }
}

+ (BOOL)addCar:(Car *)car
{
    BOOL result = [_db executeUpdate:@"insert into car(color)values(?)",car.color];
    if (!result) {
        NSLog(@"添加数据失败");
    }
    return result;
}

+ (BOOL)deleteCar:(int)ID
{
    BOOL result = [_db executeUpdate:@"delete from car where id = ?",ID];
    if (!result) {
        NSLog(@"删除数据失败");
    }
    return result;
}

+ (BOOL)updateCar:(Car *)car
{
    BOOL result = [_db executeUpdate:@"update car set color = ? where id = ?",car.color,car.ID];
    if (!result) {
        NSLog(@"删除数据失败");
    }
    return result;
}

+ (NSArray *)queryCar
{
    FMResultSet * result = [_db executeQuery:@"select * from car"];
    NSMutableArray *carArray = [NSMutableArray array];
    while (result.next) {
        Car *car = [[Car alloc]init];
        [car setID:[result intForColumn:@"ID"]];
        [car setColor:[result stringForColumn:@"color"]];
        
        [carArray addObject:car];
    }
    return carArray;
}

+ (NSArray *)queryCarByCondition:(int) ID
{
    FMResultSet * result = [_db executeQuery:@"select * from car where id like ?",ID];
    NSMutableArray *carArray = [NSMutableArray array];
    while (result.next) {
        Car *car = [[Car alloc]init];
        [car setID:[result intForColumn:@"ID"]];
        [car setColor:[result stringForColumn:@"color"]];
        
        [carArray addObject:car];
    }
    return carArray;
}

@end
