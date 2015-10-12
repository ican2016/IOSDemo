//
//  Person.h
//  KVO测试
//
//  Created by Apple-JF on 15/10/7.
//  Copyright © 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PersonDelegate <NSObject>

@optional
- (void)getNameAttre:(NSString *)name;

@end

@interface Person : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *address;
@property (weak, nonatomic)id<PersonDelegate> delegate;

- (void)personWithAction:(void (^)(NSString *name))blcok;

- (void)say;
@end
