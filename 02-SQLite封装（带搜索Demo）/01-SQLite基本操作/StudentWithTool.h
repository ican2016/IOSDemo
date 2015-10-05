//
//  StudentWithTool.h
//  01-SQLite基本操作
//
//  Created by Apple-JF on 15/10/5.
//  Copyright © 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Student;
@interface StudentWithTool : NSObject

+ (BOOL)addStudent:(Student *)student;
+ (BOOL)deleteStudent:(int)ID;
+ (BOOL)updateStudent:(Student *)student;
+ (NSArray *)queryStudent;

+ (NSArray *)queryStudentWithQuestion:(NSString *)name;

@end
