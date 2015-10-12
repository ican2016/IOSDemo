//
//  UserWithModel.m
//  网络Demo
//
//  Created by Apple-JF on 15/10/9.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "UserWithModel.h"
#import "JSONKit.h"
#import "User.h"

@implementation UserWithModel

+ (void)addUserWithAccount:(NSString *)userAcount andUserPassword:(NSString *) password andData:(void(^)(NSString *data))userData
{
    // 创建连接字符
    NSString *str = [NSString stringWithFormat:@"http://localhost/ios/other/add.php?u_account=%@&u_password=%@",userAcount,password] ;
    NSURL *path = [NSURL URLWithString:str];
    
    // 请求连接
    NSURLRequest *request = [NSURLRequest requestWithURL:path];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSArray * dic = [data objectFromJSONData];

        NSString *message = nil;
        ;
        if ([(NSString *)dic[0] isEqualToString:(NSString *)[NSNumber numberWithInt:1]]) {
            message = @"新增用户";
        }else{
            message = @"新增用户失败";
        }
        userData(message);
    }];
}

+ (void)quaryUserWithAccount:(NSString *)userAcount andUserPassword:(NSString *) password andData:(void(^)(id data))userData ;
{
    // 创建连接字符
    NSString *str = [NSString stringWithFormat:@"http://localhost/login.php?u_account=%@&u_password=%@",userAcount,password] ;
    NSURL *path = [NSURL URLWithString:str];
    // 请求连接
    NSURLRequest *request = [NSURLRequest requestWithURL:path];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSDictionary *dic = [data objectFromJSONData];
        
        userData(dic);
    }];
 
//    NSURLSession *session = [NSURLSession sharedSession];
//    
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        if (!error) {
//            NSDictionary *dic = [data objectFromJSONData];
//            userData(dic);
//        }else{
//            NSLog(@"error is %@",error.localizedDescription);
//        }
//    }];
//    
//    dispatch_async(dispatch_get_main_queue(), ^{
//          [dataTask resume];
//    });

}

+ (void)queryAllUser:(void(^)(id data)) block
{
    NSURL *url = [NSURL URLWithString:@"http://localhost/ios/other/findAll.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSArray *array = [data objectFromJSONData];
        NSMutableArray *mArray = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            User *user = [User userWithDic:dic];
            [mArray addObject:user];
        }
        block(mArray);
    }];
}

@end
