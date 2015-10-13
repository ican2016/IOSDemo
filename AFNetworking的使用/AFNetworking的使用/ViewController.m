//
//  ViewController.m
//  AFNetworking的使用
//
//  Created by Apple-JF on 15/10/7.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "AFURLResponseSerialization.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [ViewController netWorkStatus];
//    [ViewController getNet];
//    [ViewController downloadFile];
    [ViewController uploadFile];
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

+ (void)getNet
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    [manager POST:@"http://localhost/ios/other/findAll.php" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *doubi = responseObject;
        NSString *shabi =  [[NSString alloc]initWithData:doubi encoding:NSUTF8StringEncoding];
        NSLog(@"JSON: %@", shabi);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

+ (void)downloadFile
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    // soure file path
    NSURL *URL = [NSURL URLWithString:@"http://localhost/123.jpg.zip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        // get file memory path
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];

    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        // write download file path
        NSLog(@"File downloaded to: %@", filePath);
    }];
    
    // launch download task
    [downloadTask resume];
}

+ (void)uploadFile
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://localhost/ios"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

    
    NSURL *filePath = [NSURL fileURLWithPath:@"file:///Users/apple/Library/Developer/CoreSimulator/Devices/93415257-95CD-43C2-9F55-63A5D10BA85D/data/Containers/Data/Application/03DD2E0E-1CA1-4AB8-8396-4C3C08DEF6E1/Documents/123.jpg.zip"];
    
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithRequest:request fromFile:filePath progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"Success: %@ %@", response, responseObject);
        }
    }];
    [uploadTask resume];
}
@end
