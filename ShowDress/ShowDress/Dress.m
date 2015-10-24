//
//  Dress.m
//  ShowDress
//
//  Created by Apple-JF on 15/10/21.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "Dress.h"

@implementation Dress

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)dressWithDic:(NSDictionary *)dic
{
    
    return [[self alloc]initWithDic:dic];
}

@end
