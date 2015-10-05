//
//  ViewController.m
//  01-SQLite基本操作
//
//  Created by Apple-JF on 15/10/5.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
#import "Student.h"
#import "StudentWithTool.h"

@interface ViewController (){
    sqlite3 *_db;
}
- (IBAction)insert;
- (IBAction)delete;
- (IBAction)update;
- (IBAction)query;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   }

// 添加数据
- (IBAction)insert {
    // 批量添加数据
    for (int i = 0; i < 50; i++) {
        // 创建学生对象
        Student *student = [[Student alloc]init];
        // 存放数据
        [student setName:[NSString stringWithFormat:@"jack %d",arc4random()%100]];
        [student setAge:arc4random()%100];
        
        // 掉用存储数据的方法
        BOOL result = [StudentWithTool addStudent:student];
        if (result) {
            NSLog(@" 添加成功");
        }else{
            NSLog(@"添加失败");
        }
    }
}

// 删除数据
- (IBAction)delete {
    
    BOOL result = [StudentWithTool deleteStudent:12];
    if (result) {
        NSLog(@"数据删除成功");
    }else{
        NSLog(@"数据更新失败");
    }
    
}

// 更新一条数据
- (IBAction)update {
    Student *student = [[Student alloc]init];
    [student setName:@"李莫愁"];
    [student setAge:20];
    BOOL result = [StudentWithTool updateStudent:student];
    
    if (result) {
        NSLog(@"数据更新成功");
    }else{
        NSLog(@"数据更新失败");
    }
}

// 查询数据
- (IBAction)query {
    
    NSArray *studentArray = [StudentWithTool queryStudent];
    for (Student *s in studentArray) {
        NSLog(@"%d | %@ | %d",s.ID,s.name,s.age);
    }

}

- (void)dealloc
{
    sqlite3_close(_db);
    NSLog(@"成功关闭数据库");
}
@end
