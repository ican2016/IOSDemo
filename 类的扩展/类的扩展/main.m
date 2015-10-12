//
//  main.m
//  类的扩展
//
//  Created by Apple-JF on 15/10/8.
//  Copyright © 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
  
        Person *person = [Person new];
        [person setNumber:@(3)];
        NSNumber *number = [person getNum];
        NSLog(@"%@",number);
    }
    return 0;
}
