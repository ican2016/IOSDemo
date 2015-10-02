//
//  ViewController.m
//  基本的绘图操作
//
//  Created by Apple-JF on 15-9-25.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import "ViewController.h"
#import "LineView.h"

@interface ViewController ()
- (IBAction)sizeChanged:(UISlider *)sender;

@property (weak, nonatomic) IBOutlet LineView *displayView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(say) userInfo:nil repeats:YES];
    
//    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(say)];
//    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}


- (IBAction)sizeChanged:(UISlider *)sender {
    self.displayView.hightVal = sender.value;
    NSLog(@"%f",sender.value);
}
float i = 50;

- (void)say
{
    if (i == 60) {
        i = 50;
        self.displayView.hightVal = i;
  
    }else{
        i = 60;
        self.displayView.hightVal = i;
    }
    NSLog(@"%f",i);
    
}
@end
