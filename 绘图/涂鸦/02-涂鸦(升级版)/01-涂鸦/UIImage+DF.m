//
//  UIImage+DF.m
//  01-涂鸦
//
//  Created by Apple-JF on 15/10/1.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "UIImage+DF.h"

@implementation UIImage (DF)

+ (instancetype)captureWithView:(UIView *)view
{
    // 1.开启上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    
    // 2.将控制器view的layer渲染到上下文
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    // 3.取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 4.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
