//
//  Person.h
//  类的扩展
//
//  Created by Apple-JF on 15/10/8.
//  Copyright © 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    NSNumber *_number;
}

- (NSNumber *)getNum;

@end

@interface Person()


@property (strong, nonatomic)NSString *name;
- (void)setNumber:(NSNumber *)number;
- (void)say;
@end
