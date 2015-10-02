//
//  FileManager.m
//  打印技术网址
//
//  Created by Apple-JF on 15-9-27.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager

- (void)operation
{
    // 获取文件管理类
    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSString *path = @"/Users/apple/downloads/信件打包";
    
    NSArray *arrays = [fm contentsOfDirectoryAtPath:path error:nil];
    
    for (NSString *str in arrays) {
        // 获取文件路径
        NSString *filePath = [path stringByAppendingString:[NSString stringWithFormat:@"/%@",str]];
        // 获取文件内容
//        NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        NSData *d = [NSData dataWithContentsOfFile:filePath];
        NSString *fileContent = [[NSString alloc]initWithData:d encoding:NSUTF8StringEncoding];
        NSLog(@"%@",fileContent);
//        NSRange rangeBegin = [fileContent rangeOfString:@"http://"];
//        NSString *strSource = [fileContent substringWithRange:NSMakeRange(0 ,fileContent.length)];
//        NSLog(@"%@",strSource);
        
    }
    
}

@end
