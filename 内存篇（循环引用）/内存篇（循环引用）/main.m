//
//  main.m
//  内存篇（循环引用）
//
//  Created by Apple-JF on 15/10/13.
//  Copyright © 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Person *p = [Person new];
        Car *c = [Car new];

//        p.car = c;
//        c.person = p;
        
        [p setPs:@"tomorrow"];
        [c setC:[p ps]];
        [p setPs:nil];
        NSLog(@"%@  %@",[c c],[p ps]);
  
        [p release];
        [c release];
    }
    return 0;
}
