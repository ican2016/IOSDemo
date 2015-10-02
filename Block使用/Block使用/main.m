//
//  main.m
//  Block使用
//
//  Created by Apple-JF on 15-9-28.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

typedef int(^MyBlock) (int num1,int num2);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        MyBlock myBlock  = ^(int i,int j){
            return i+j;
        };
        
        NSLog(@"%d",myBlock(1,2));
        const NSString *j = @"hello";
        j = @"world";
        NSLog(@"%@",j);
        Person *p = [Person personWith];
        NSLog(@"%@",p);
        
        Person *p1 = [Person personWith];
        NSLog(@"%@",p1);

//        // kvc
//        Person *p2 = [Person personWith];
//        [p2 setValue:@"彭军飞" forKey:@"name"];
//        [p2 setValue:@"彭家" forKeyPath:@"name"];
//        NSLog(@"%@",[p2 valueForKey:@"name"]);
        
        Person *p3 = [[Person alloc]init];
//        p3.name = @"1";
//        p3.name = @"2";
     
    }
    return 0;
}
