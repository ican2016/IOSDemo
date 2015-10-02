//
//  LineView.m
//  基本的绘图操作
//
//  Created by Apple-JF on 15-9-25.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import "LineView.h"

@implementation LineView

- (void)drawRect:(CGRect)rect
{
//    draw4Rect();
//    drawTiangle();
//    drawEllipse();
//    drawArc();
//    drawFont();
//    drawImage();
//    contextStatus();
//    contentClip();
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _hightVal = 50;
    });
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    [[UIColor redColor]set];
    CGContextAddEllipseInRect(ref, CGRectMake(150, 150, _hightVal , _hightVal));
    CGContextFillPath(ref);
}
// 重绘，刷新
- (void)setHightVal:(float)hightVal
{
    _hightVal = hightVal;
    // 重新绘制view
    [self setNeedsDisplay];
    // 更精确重绘指定的地方
//    [self setNeedsDisplayInRect:CGRectMake(1, 0, 0, 0)];
}

// 裁剪
void contentClip()
{
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ref, CGRectMake(100, 100, 50, 50));
    // 这句话执行完之后可以裁剪掉覆盖在圆上多余的部分
    CGContextClip(ref);
    
    UIImage *img = [UIImage imageNamed:@"me"];
    [img drawInRect:CGRectMake(100, 100, 50, 50)];
    
    CGContextStrokePath(ref);
}

// 图形上下文状态
void contextStatus()
{

    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    // 将上下文从新拷贝一份
    CGContextSaveGState(ref);
    
    // 画椭圆
    CGContextAddEllipseInRect(ref, CGRectMake(10, 10, 100, 100));
    // 设置线宽
    CGContextSetLineWidth(ref, 5);
    // 设置颜色
    [[UIColor redColor]set];
    CGContextStrokePath(ref);
    // 撤销上下文之间所设置的属性，从新开始
    CGContextRestoreGState(ref);
    
    // 设置线宽
    CGContextSetLineWidth(ref, 1);
    // 设置颜色
    [[UIColor orangeColor]set];
    CGContextAddEllipseInRect(ref, CGRectMake(10, 240, 50, 50));
    
    // 图形渲染
    CGContextStrokePath(ref);
}

// 画图片
void drawImage()
{
    UIImage *img = [UIImage imageNamed:@"me"];
    // 设置自定义大小图
//    [img drawInRect:CGRectMake(10, 10, 100, 100)];
    // 只设置图片的坐标点
//    [img drawAtPoint:CGPointMake(100, 100)];
    // 平铺图片
    [img drawAsPatternInRect:CGRectMake(10, 10, 200, 200)];
}

// 画文字
void drawFont()
{
    NSString *str = @"这是一个测试的文字，他将被打印在屏幕上指定位置，Hello world";
    // 第一种画文字的方法
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    dic[NSForegroundColorAttributeName] = [UIColor redColor];
//    [str drawAtPoint:CGPointMake(20, 20) withAttributes:dic];
    
    // 第二种画文字的方法
    CGRect rect = CGRectMake(10, 10, 100, 100);
    // 画矩形
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextAddRect(ref, rect);
    CGContextFillPath(ref);
    // 画文字
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = [UIColor orangeColor];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [str drawInRect:rect withAttributes:dic];
}

// 圆弧
void drawArc()
{
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 100 ,100 圆点  10圆的半径  M_PI起点角度 0终点角度 clockwise(0,1)圆弧的起点方向
    CGContextAddArc(ref, 150, 200, 100, M_PI_2, 0, 0);
    
    CGContextSetLineWidth(ref, 10);
    
    [[UIColor orangeColor]set];
//    CGContextStrokePath(ref);
    CGContextFillPath(ref);
    
}

// 椭圆（圆）
void drawEllipse()
{
    
    // 创建上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 椭圆
    CGContextAddEllipseInRect(ref, CGRectMake(10, 10, 250 , 250));
    CGContextSetLineWidth(ref, 5);
    [[UIColor redColor] set];
    CGContextStrokePath(ref);
}

// 三角形
void drawTiangle()
{
    // 1.创建上下文
    CGContextRef cr = UIGraphicsGetCurrentContext();
    
    // 设置线条头尾样式
    CGContextSetLineCap(cr, kCGLineCapRound);
    // 绘制线的起点
    CGContextMoveToPoint(cr, 10, 10);
        // 第二个点
    CGContextAddLineToPoint(cr, 120, 80);
    // 第三个点
    CGContextAddLineToPoint(cr, 90 , 30);
    // 关闭创建的线
    CGContextClosePath(cr);
    
    // 第二条线的起点
    CGContextMoveToPoint(cr, 100 , 200);
    // 第二个点
    CGContextAddLineToPoint(cr, 300, 270);
    // 线条的宽度
    CGContextSetLineWidth(cr, 10);
    
    // 线条的颜色（第一种方法）
//    CGContextSetRGBStrokeColor(cr, 1, 0, 0, 1);
    // 线条的颜色（第二种方式）set同时设置实心和空心颜色
//    [[UIColor blueColor] set];
//    CGColor *cgc = [UIColor redColor].CGColor;
    
    // 通过一组点，画三角形
    CGPoint point[3];
    point[0] = CGPointMake(100, 300);
    point[1] = CGPointMake(30, 100);
    point[2] = CGPointMake(70, 100);
    CGContextAddLines(cr, point, 3);
    CGContextClosePath(cr);
    
    // 渲染显示到视图上(一个上下文可以实现多次渲染)
    CGContextStrokePath(cr);
    // 渲染(实心)
//    CGContextFillPath(cr);
    
}

// 矩形
void draw4Rect()
{
    // 创建上下文
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    // 绘制矩形
    CGContextAddRect(ctr, CGRectMake(10, 0, 100, 100));
    // 渲染(空心)
    CGContextStrokePath(ctr);
    // 渲染(实心)
//    CGContextFillPath(ctr);
    
    /*画圆角矩形*/
    float fw = 180;
    float fh = 280;
    CGContextMoveToPoint(ctr, fw, fh-20);  // 开始坐标右边开始
    CGContextAddArcToPoint(ctr, fw, fh, fw-20, fh, 10);  // 右下角角度
    CGContextAddArcToPoint(ctr, 120, fh, 120, fh-20, 10); // 左下角角度
    CGContextAddArcToPoint(ctr, 120, 250, fw-20, 250, 10); // 左上角
    CGContextAddArcToPoint(ctr, fw, 250, fw, fh-20, 10); // 右上角
    CGContextClosePath(ctr);
    CGContextDrawPath(ctr, kCGPathStroke); //根据坐标绘制路径
}

@end
