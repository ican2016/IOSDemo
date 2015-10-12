//
//  ViewController.m
//  KVO测试
//
//  Created by Apple-JF on 15/10/7.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()<PersonDelegate>

@property (strong, nonatomic)Person *person;
@property (weak, nonatomic) IBOutlet UITextField *nameTextFiel;
- (IBAction)but;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *person = [Person new];
    self.person = person;
    self.person.delegate = self;
    // 注册观察者
    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    [self thread];
   
}

- (void)thread
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@" main %@",[NSThread currentThread]);
    });
    
    dispatch_async(dispatch_queue_create("async", DISPATCH_QUEUE_CONCURRENT ), ^{
        
        NSLog(@"%@",[NSThread currentThread]);
        
        dispatch_async(dispatch_queue_create("async", DISPATCH_QUEUE_CONCURRENT ), ^{
            
            NSLog(@"%@",[NSThread currentThread]);
        });
        dispatch_async(dispatch_queue_create("async", DISPATCH_QUEUE_CONCURRENT ), ^{
            
            NSLog(@"%@",[NSThread currentThread]);
        });
        dispatch_async(dispatch_queue_create("async", DISPATCH_QUEUE_CONCURRENT ), ^{
            
            NSLog(@"%@",[NSThread currentThread]);
        });
    });
}

// 更改属性值
- (IBAction)but {
    
    self.person.name = self.nameTextFiel.text;
    [self.person say];
    NSLog(@"%@ ",self.person.name);
    [self.person personWithAction:^(NSString *name) {
        NSLog(@"block %@",name);
    }];
    
}
// 观察实现的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"value change  %@",keyPath);
    }

}



// 代理（委托）
- (void)getNameAttre:(NSString *)name
{
    NSLog(@"delegate %@",name);
}

- (void)dealloc
{
    // 注销观察者
    [self.person removeObserver:self forKeyPath:@"name"];
}
@end
