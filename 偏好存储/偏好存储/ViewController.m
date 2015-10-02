//
//  ViewController.m
//  偏好存储
//
//  Created by Apple-JF on 15-9-25.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建偏好对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // 存值
    [defaults setObject:@"daojiao" forKey:@"name"];
    // 同步
    [defaults synchronize];
    // 取值
    NSString *str = [defaults objectForKey:@"name"];
    
    NSLog(@"%@",str);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
