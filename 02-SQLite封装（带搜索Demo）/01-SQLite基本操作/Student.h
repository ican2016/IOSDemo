//
//  Student.h
//  01-SQLite基本操作
//
//  Created by Apple-JF on 15/10/5.
//  Copyright © 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (assign, nonatomic)int ID;
@property (strong, nonatomic)NSString *name;
@property (assign, nonatomic)int age;

@end
