//
//  Person.m
//  KVO测试
//
//  Created by Apple-JF on 15/10/7.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)personWithAction:(void (^)(NSString *name))blcok
{
    blcok(self.name);
    
}

- (void)say
{

    if ([self.delegate respondsToSelector:@selector(getNameAttre:)]) {
        [self.delegate getNameAttre:_name];
    }

}


@end
