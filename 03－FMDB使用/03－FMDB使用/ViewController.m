//
//  ViewController.m
//  03－FMDB使用
//
//  Created by Apple-JF on 15/10/5.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "CarTool.h"

@interface ViewController ()
- (IBAction)insert;
- (IBAction)delete;
- (IBAction)update;
- (IBAction)query;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)insert {
    
    for (int i = 0; i < 20; i++) {
        Car *car = [[Car alloc]init];
        [car setColor:[NSString stringWithFormat:@"红色 %d",arc4random()%100]];

        [CarTool addCar:car];
    }
    
}

- (IBAction)delete {
}

- (IBAction)update {
}

- (IBAction)query {
    
    NSArray *car = [CarTool queryCar];
    for (Car *c in car) {
        NSLog(@"%d |  %@",c.ID,c.color);
    }
}
@end
