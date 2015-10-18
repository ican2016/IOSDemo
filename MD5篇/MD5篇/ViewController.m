//
//  ViewController.m
//  MD5篇
//
//  Created by Apple-JF on 15/10/14.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Password.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"彭诗的李丽的开始军分到一起飞";
    NSLog(@"%@",[str SHA1]);
    
}

@end
