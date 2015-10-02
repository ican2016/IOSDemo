//
//  ViewController.m
//  popover的使用
//
//  Created by Apple-JF on 15-9-25.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic ,strong) UIPopoverController *popover;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)meunOption:(id)sender {
    
    // 1.创建自控制器
    UITableViewController *tv = [[UITableViewController alloc]init];
    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:tv];
    
    // 2.创建popover对象
    self.popover = [[UIPopoverController alloc]initWithContentViewController:nvc];
    
    // 3.箭头显示的位置
    [self.popover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}
- (IBAction)titleMeunOption:(id)sender {
}

    

@end
