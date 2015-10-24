//
//  Dress.h
//  ShowDress
//
//  Created by Apple-JF on 15/10/21.
//  Copyright © 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dress : NSObject

@property (strong, nonatomic)NSArray *imageList;
@property (strong, nonatomic)NSString *dressName;
@property (assign, nonatomic)int currentPrice;
@property (assign, nonatomic)int price;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)dressWithDic:(NSDictionary *)dic;

@end
