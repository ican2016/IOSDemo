//
//  User.m
//  网络Demo
//
//  Created by Apple-JF on 15/10/9.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)userWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}

@end
