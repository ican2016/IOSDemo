//
//  Person.m
//  类的扩展
//
//  Created by Apple-JF on 15/10/8.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "Person.h"



@implementation Person

-(NSNumber *)getNum{
    return  _number;
}

- (void)setNumber:(NSNumber *)number{
    _number = number;
}

-(void)say{
    NSLog(@"今天需努力，明天会更好");
    NSLog(@"吃苦在当下，幸福是一种信念");
}

@end
