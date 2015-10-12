//
//  UserWithModel.h
//  网络Demo
//
//  Created by Apple-JF on 15/10/9.
//  Copyright © 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;
@interface UserWithModel : NSObject

@property (strong, nonatomic) User *user;

+ (void)quaryUserWithAccount:(NSString *)userAcount andUserPassword:(NSString *) password andData:(void(^)(id data))userData ;
+ (void)queryAllUser:(void(^)(id data)) block;

+ (void)addUserWithAccount:(NSString *)userAcount andUserPassword:(NSString *) password andData:(void(^)(NSString * data))userData ;

@end
