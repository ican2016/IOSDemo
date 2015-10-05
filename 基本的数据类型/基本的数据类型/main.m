//
//  main.m
//  基本的数据类型
//
//  Created by Apple-JF on 15/10/4.
//  Copyright © 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"=");
        });
        
    }
    return 0;
}
