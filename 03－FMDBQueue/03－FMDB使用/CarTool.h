//
//  CarTool.h
//  03－FMDB使用
//
//  Created by Apple-JF on 15/10/5.
//  Copyright © 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Car;
@interface CarTool : NSObject

+ (BOOL)addCar:(Car *)car;

+ (BOOL)deleteCar:(int)ID;

+ (BOOL)updateCar:(Car *)car;

+ (NSArray *)queryCar;

+ (NSArray *)queryCarByCondition:(int) ID;

@end
