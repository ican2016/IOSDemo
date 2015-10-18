//
//  Car.m
//  内存篇（循环引用）
//
//  Created by Apple-JF on 15/10/13.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "Car.h"
#import "Person.h"

@implementation Car

- (void)setPerson:(Person *)person
{
    if (_person != person) {
        [person release];
        _person = [person retain];
    }
}
- (Person *)person
{
    return _person;
}

-(void)dealloc
{
    [self.person release];
    NSLog(@"Car destroy!");
    [super dealloc];
}
@end
