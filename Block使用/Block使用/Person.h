//
//  Person.h
//  Block使用
//
//  Created by Apple-JF on 15-9-28.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong, nonatomic) NSString *name;

+ (instancetype)personWith;

@end
