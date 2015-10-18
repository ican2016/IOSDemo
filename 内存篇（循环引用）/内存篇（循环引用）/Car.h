//
//  Car.h
//  内存篇（循环引用）
//
//  Created by Apple-JF on 15/10/13.
//  Copyright © 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;
@interface Car : NSObject{
    Person *_person;
}

@property (strong, nonatomic)NSString *c;

- (void)setPerson:(Person *)person;
- (Person *)person;

@end
float