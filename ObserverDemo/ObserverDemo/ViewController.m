//
//  ViewController.m
//  ObserverDemo
//
//  Created by Apple-JF on 15-9-29.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *chageText;
@property (weak, nonatomic) IBOutlet UITextField *chageField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addObserver:self forKeyPath:@"chageField" options:NSKeyValueObservingOptionNew context:nil];

}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"%@",keyPath);
}


@end
