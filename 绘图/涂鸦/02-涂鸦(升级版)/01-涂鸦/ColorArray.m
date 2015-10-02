//
//  ColorArray.m
//  01-涂鸦
//
//  Created by Apple-JF on 15/10/1.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "ColorArray.h"

@implementation ColorArray

- (NSMutableArray *)colorTotal
{
    NSMutableArray *tmp = [NSMutableArray array];

    NSArray *c1 = @[@"红色",@(1),@(0),@(0)];
    [tmp addObject:c1];
    NSArray *c2 = @[@"黑色",@(0),@(0),@(0)];
    [tmp addObject:c2];
    NSArray *c3 = @[@"蓝色",@(0),@(0),@(1)];
    [tmp addObject:c3];
    NSArray *c4 = @[@"绿色",@(0),@(1),@(0)];
    [tmp addObject:c4];
    
    return tmp;
}

@end
