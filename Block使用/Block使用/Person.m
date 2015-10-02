//
//  Person.m
//  Block使用
//
//  Created by Apple-JF on 15-9-28.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import "Person.h"

@implementation Person

static Person *persons;
+ (instancetype)personWith
{
    if (!persons) {
        persons = [[Person alloc]init];
    }
    return persons;
}


- (void)setName:(NSString *)name
{
    _name = name;
    [self addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"===");
    }
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"name"];
}
@end
