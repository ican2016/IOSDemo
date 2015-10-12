//
//  ViewController.m
//  AFNetworking的使用
//
//  Created by Apple-JF on 15/10/7.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ViewController netWorkStatus];
    [ViewController JSONData];
}

#pragma mark - 获取当前网络状态
+ (void)netWorkStatus
{
    // 打开检查网络状态管理器（单利）
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
    
    // 获取网络当前状态
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {

        NSLog(@"%lu",status);
    }];
}

+ (void)JSONData
{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    NSDictionary *dic = @{@"u_account":@" lisi",@"u_password":@"123"};
//    
//    [manager GET:@"http://localhost/login.php" parameters:dic success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        
//        NSLog(@"%@",responseObject);
//    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
//        
//        NSLog(@"%@",error);
//    }];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *dic = @{@"u_account":@" lisi",@"u_password":@"123"};

    [manager GET:@"http://localhost/login.php" parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@", error);

    }];
    
}

@end
