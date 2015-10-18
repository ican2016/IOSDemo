//
//  ViewController.m
//  post）
//
//  Created by Apple-JF on 15/10/14.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD.h"

@interface ViewController ()<MBProgressHUDDelegate>
{
    MBProgressHUD *_HUD;
}
@property (strong, nonatomic) IBOutlet UITextField *accountOfField;
@property (strong, nonatomic) IBOutlet UITextField *passwordOfField;
@property (strong, nonatomic) IBOutlet UIButton *loginOfButton;
@property (strong, nonatomic) IBOutlet UILabel *messageLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)loginButton:(id)sender {
    
    [self postLogin];
}

- (void)getLogin
{
    NSLog(@"get");
    NSString *str = [NSString stringWithFormat:@"http://localhost/ios/other/findOne.php?u_account=%@&u_password=%@",self.accountOfField.text,self.passwordOfField.text];
    NSURL *url = [NSURL URLWithString:str];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]  completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (!connectionError) {
            
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//            NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",array);
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.messageLabel.text = str;
            }];
        }else{
            NSLog(@"网络操作失败");

        }
    }];
}

- (void)postLogin
{
    NSString *str = [NSString stringWithFormat:@"http://localhost/ios/other/findOne.php"];
    NSURL *url = [NSURL URLWithString:str];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    NSString *parameter = [NSString stringWithFormat:@"u_account=%@&u_password=%@",self.accountOfField.text,self.passwordOfField.text] ;
    request.HTTPBody = [parameter dataUsingEncoding:NSUTF8StringEncoding];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]  completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (!connectionError) {
            
            NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];

            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://ww4.sinaimg.cn/bmiddle/6ff93610gw1ewwgyv1369j23402c07wi.jpg"]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.messageLabel.text = str;
                self.imageView.image = [[UIImage alloc]initWithData:imageData];
            });
        }else{
            _HUD = [[MBProgressHUD alloc] initWithView:self.view];
            [self.view addSubview:_HUD];
            _HUD.delegate = self;
             _HUD.labelText = @"网络操作失败";
            [_HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
//            UITableView *tableView = [[UITableView alloc]init];
//            [tableView reloadData];
//            [tableView reloadRowsAtIndexPaths:@(0) withRowAnimation:UITableViewRowAnimationNone];
            
            self.imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
            
            [NSThread sleepForTimeInterval:2.0f];
        }
    }];
}

- (void)myTask {
    sleep(2.0f);
}
@end
