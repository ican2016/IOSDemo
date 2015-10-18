//
//  PaintView.m
//  01-涂鸦
//
//  Created by Apple-JF on 15/10/1.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "PaintView.h"
#import "UIImage+DF.h"
#import "MBProgressHUD+MJ.h"
#import "ColorArray.h"

@interface PaintView()

@property(nonatomic ,strong) NSMutableArray *totalPoints;
@property(nonatomic ,strong) ColorArray *color;

@end

@implementation PaintView

- (instancetype)init
{
    self = [super init];
    if (self) {
     
    }
    return self;
}

// 数组懒加载
- (NSMutableArray *)totalPoints
{
    if (!_totalPoints) {
        _totalPoints = [NSMutableArray array];
    }
    return _totalPoints;
}

// 清屏
- (void)clearEmpty
{
    [self.totalPoints removeAllObjects];
    [self setNeedsDisplay];
}

// 撤销
- (void)back
{
    [self.totalPoints removeLastObject];
    [self setNeedsDisplay];
}
// 保持
- (void)save
{
    // 1.截图
    UIImage *img = [UIImage captureWithView:self];
    // 2.保存图片
    UIImageWriteToSavedPhotosAlbum(img, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

// 保存图片的反馈
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        [MBProgressHUD showError:@"保存失败"];
    }else{
        [MBProgressHUD showSuccess:@"保存成功"];
    }
}
// 设置画笔的宽度
- (void)setLineWight:(int)lineWight
{
    _lineWight = lineWight;
    NSLog(@"%d",lineWight);
    [self setNeedsDisplay];
}

// 设置线条的颜色
- (void)setLineColor:(int)lineColor
{
    _lineColor = lineColor;
    [self setNeedsDisplay];
}

// 起点
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 获取坐标点
    UITouch *touch = [touches anyObject];
    CGPoint beginPoint = [touch locationInView:touch.view];
    
    // 存储坐标点
    UIBezierPath *currentPath = [UIBezierPath bezierPath];
    currentPath.lineWidth = 5;
    [currentPath moveToPoint:beginPoint];
    [self.totalPoints addObject:currentPath];
    [self setNeedsDisplay];
    
}

// 连线
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint movePoint = [touch locationInView:touch.view];
    UIBezierPath *currentPath = [self.totalPoints lastObject];
    [currentPath addLineToPoint:movePoint];
    [self setNeedsDisplay];
}

// 最后的线
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touchesMoved:touches withEvent:event];
}

// 画图
- (void)drawRect:(CGRect)rect
{
    // 创建上线文
    for (UIBezierPath *path in self.totalPoints) {
        [path stroke];
    }
}

@end
