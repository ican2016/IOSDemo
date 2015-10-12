//
//  User.h
//  网络Demo
//
//  Created by Apple-JF on 15/10/9.
//  Copyright © 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (assign, nonatomic)int u_id; // 用户编号
@property (strong, nonatomic)NSString *u_account; // 账号
@property (strong, nonatomic)NSString *u_password; // 密码

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)userWithDic:(NSDictionary *)dic;

@end
