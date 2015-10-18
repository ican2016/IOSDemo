//
//  Person.h
//  内存篇（循环引用）
//
//  Created by Apple-JF on 15/10/13.
//  Copyright © 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Car;
@interface Person : NSObject{
    
    Car *_car;
}

@property (strong, nonatomic)NSString *ps;

- (void)setCar:(Car *)car;
- (Car *)car;


@end
