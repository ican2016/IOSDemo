//
//  ViewController.m
//  plist文件的读写
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

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 读数据
- (IBAction)readerData:(id)sender {
    
    // 获取沙盒的根目录
    NSString *path = NSHomeDirectory();
    
    // 拼接Documents目录路径
    NSString *docPath = [path stringByAppendingPathComponent:@"Documents"];
    
    // 文件路径
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    
    NSMutableArray *data = [NSMutableArray arrayWithContentsOfFile:filePath];
    
    NSArray *a = data[0];
    for (NSString *str in a) {
        NSLog(@"%@",str);
    }
    
}

// 写数据
- (IBAction)writerData:(id)sender {
    // 获取沙盒的根目录
    NSString *path = NSHomeDirectory();
    
    // 拼接Documents目录路径
    NSString *docPath = [path stringByAppendingPathComponent:@"Documents"];
    
    // 文件路径
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    
    NSMutableArray *moryArray = [NSMutableArray array];
    
    NSArray *a = @[@"道教",@(2)];
    [moryArray insertObject:a atIndex:0];

    [moryArray writeToFile:filePath atomically:YES];

}

@end
