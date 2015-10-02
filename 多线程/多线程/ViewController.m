//
//  ViewController.m
//  多线程
//
//  Created by Apple-JF on 15-9-30.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"===%@",[NSThread currentThread]);
    
    UIButton *but = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    [but setTitle:@"Click Me" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [but setBackgroundColor:[UIColor yellowColor]];
    [but addTarget:self action:@selector(queue) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:but];
}

- (void)queue
{
    // 全局只执行一次（处理单利问题）
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        NSLog(@"%@" ,[NSThread currentThread] );
//    });

    // 主线程队列
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"%@" ,[NSThread currentThread] );
//    });
    
    // 全局队列
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"%@" ,[NSThread currentThread] );
//    });
    
    // 延迟执行
//    double delayInseconds = 2.0;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInseconds * NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"%@" ,[NSThread currentThread] );
//    });
    
    // 执行代码块5次
//    dispatch_apply(5, dispatch_queue_create("fa", DISPATCH_QUEUE_CONCURRENT), ^(size_t index) {
//        NSLog(@"%@" ,[NSThread currentThread] );
//    });
}

@end
