//
//  Person.m
//  内存篇（循环引用）
//
//  Created by Apple-JF on 15/10/13.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "Person.h"
#import "Car.h"

@implementation Person

- (void)setCar:(Car *)car
{
    if (_car != car) {
        [car release];
        _car = [car retain];
    }
}
- (Car *)car
{
    return _car;
}

-(void)dealloc
{
    NSLog(@"Person destroy");
    [self.car release];
    [super dealloc];
}
@end
