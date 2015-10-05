//
//  StudentWithTool.m
//  01-SQLite基本操作
//
//  Created by Apple-JF on 15/10/5.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "StudentWithTool.h"
#import "Student.h"
#import <sqlite3.h>
@interface StudentWithTool()

@end
@implementation StudentWithTool

// 声明数据库实例
static sqlite3 *_db;

+ (void)initialize
{
    // 1.获取数据库文件
    NSString *fileName = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"student.sqlite"];
    
    // 2.打开数据库（创建数据库实例）
    int result = sqlite3_open(fileName.UTF8String, &_db);
    
    // 3.检查数据库是否正常打开
    // SQLITE_OK是一个常量，表示执行成功
    if (result == SQLITE_OK) {
        
        NSLog(@"成功打开数据库");
        
        // 4.建表
        // 4.1 生成建表语句（表只会创建一次）
        const char *sql = "create table if not exists s_student(id integer primary key autoincrement,name text,age integer);";
        char *error = NULL;
        // 4.2 执行建表语句
        int result = sqlite3_exec(_db, sql, NULL, NULL, &error);
        if (result == SQLITE_OK) {
            NSLog(@"成功创建表");
        }else{
            NSLog(@"创建表失败%s",error);
        }
        
    }else{
        NSLog(@"打开数据库失败");
    }
}

//  add student data
+ (BOOL)addStudent:(Student *)student
{
    NSString *sql = [NSString stringWithFormat:@"insert into s_student(name,age)values('%@',%d)",student.name ,student.age];
    char *error;
    int result = sqlite3_exec(_db, sql.UTF8String, NULL, NULL, &error);
    return result == SQLITE_OK;
}

+ (BOOL)deleteStudent:(int)ID
{
    // 1. 删除一条sql语句
    NSString *sql = [NSString stringWithFormat:@"delete from s_student where age=%d ",ID];
    char *error = NULL;
    
    // 2.执行sql语句
    int result = sqlite3_exec(_db, sql.UTF8String, NULL, NULL, &error);
    
    // 3.判断返回值是否正确
    return result == SQLITE_OK;
//    if (result == SQLITE_OK) {
//        NSLog(@"数据删除成功");
//    }else{
//        NSLog(@"删除数据失败%s",error);
//    }
}

+ (BOOL)updateStudent:(Student *)student
{
    // 1. 更新一条sql语句
    NSString *sql = [NSString stringWithFormat:@"update s_student set name = '%@' where age = %d",student.name ,student.age];
    
    char *error;
    // 2. 执行sql语句
    int result = sqlite3_exec(_db, sql.UTF8String, NULL, NULL, &error);
    
    // 3. 判读返回值是否正确
    return result == SQLITE_OK;
//    if (result == SQLITE_OK) {
//        NSLog(@"数据修改成功");
//    }else{
//        NSLog(@"修改数据失败%s",error);
//    }
//    
}

// query all student data
+ (NSArray *)queryStudent
{
    NSMutableArray *studentArray ;
    // 1.查询sql语句
    NSString *sql = @"select id,name,age from s_student";
    
    // 2 定义一个sqlite3_stem存放数据结果集
    sqlite3_stmt *stmt = NULL;
    
    // 3 检查sql的合法性
    int result = sqlite3_prepare_v2(_db, sql.UTF8String, -1, &stmt, NULL);
    if (result == SQLITE_OK) {
        NSLog(@" 查询语法合法");
        studentArray = [NSMutableArray array];
        
        // 4 执行sql
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            
           Student *student = [[Student alloc]init];
            // 获取数据库中取出的数据
            int ID = sqlite3_column_int(stmt, 0);
            [student setID:ID];
            // 将c字符转化成oc字符
            NSString *name = [NSString stringWithUTF8String: (const char*)sqlite3_column_text(stmt, 1)];
            [student setName:name];
            int age = sqlite3_column_int(stmt, 2);
            [student setAge:age];
            
            [studentArray addObject:student];
        }

    }else{
        NSLog(@" 查询语法不合法");
    }
    return studentArray;
}

// 模糊查询学生姓名
+ (NSArray *)queryStudentWithQuestion:(NSString *)name
{
    NSMutableArray *studentArray ;
    // 1.查询sql语句
    NSString *sql = @"select id,name,age from s_student where name like ?";
    
    // 2 定义一个sqlite3_stem存放数据结果集
    sqlite3_stmt *stmt = NULL;

    // 3 检查sql的合法性－1 表示系统自动计算sql的字符长度
    int result = sqlite3_prepare_v2(_db, sql.UTF8String, -1, &stmt, NULL);
    if (result == SQLITE_OK) {
        NSLog(@" 查询语法合法");
        studentArray = [NSMutableArray array];
        // 3.1 检查传入的参数是否合法（预防sql注入）
        //  添加参数
        NSString *newName = [NSString stringWithFormat:@"%%%@%%",name];
        sqlite3_bind_text(stmt, 1, newName.UTF8String, -1, NULL);
        NSLog(@"%@",newName);
        // 4 执行sql
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            
            Student *student = [[Student alloc]init];
            // 获取数据库中取出的数据
            int ID = sqlite3_column_int(stmt, 0);
            [student setID:ID];
            // 将c字符转化成oc字符
            NSString *name = [NSString stringWithUTF8String: (const char*)sqlite3_column_text(stmt, 1)];
            [student setName:name];
            int age = sqlite3_column_int(stmt, 2);
            [student setAge:age];
            
            [studentArray addObject:student];
        }
        
    }else{
        NSLog(@" 查询语法不合法");
    }
    return studentArray;
}

@end
