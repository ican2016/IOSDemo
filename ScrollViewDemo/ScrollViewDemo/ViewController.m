//
//  ViewController.m
//  ScrollViewDemo
//
//  Created by Apple-JF on 15/10/19.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "ViewController.h"
#import "DressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 220, 282)];
    scroll.contentSize = CGSizeMake(660, 282);
    scroll.pagingEnabled = YES;
    scroll.bounces = NO;
    scroll.showsHorizontalScrollIndicator = NO;
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nz1.jpg"]];
    UIImageView *image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nz2.jpg"]];
    UIImageView *image2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nz3.jpg"]];
    image.frame = CGRectMake(0, 0, 220, 282);
    image1.frame = CGRectMake(220, 0, 220, 282);
    image2.frame = CGRectMake(440, 0, 220, 282);
    [scroll addSubview:image];
    [scroll addSubview:image1];
    [scroll addSubview:image2];
    [self.view addSubview:scroll];
}

@end
