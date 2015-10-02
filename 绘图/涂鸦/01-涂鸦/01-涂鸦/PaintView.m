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
    UITouch *touch = [touches anyObject];
    CGPoint beginPoint = [touch locationInView:touch.view];
    NSMutableArray *points = [NSMutableArray array];
    [points addObject:[NSValue valueWithCGPoint:beginPoint]];
    [self.totalPoints addObject:points];
    [self setNeedsDisplay];
    
}

// 连线
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint movePoint = [touch locationInView:touch.view];
    NSMutableArray *points = [self.totalPoints lastObject];
    [points addObject:[NSValue valueWithCGPoint:movePoint]];
    [self setNeedsDisplay];
}

// 最后的线
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint endPoint = [touch locationInView:touch.view];
    NSMutableArray *points = [self.totalPoints lastObject];
    [points addObject:[NSValue valueWithCGPoint:endPoint]];
    [self setNeedsDisplay];
}

// 画图
- (void)drawRect:(CGRect)rect
{
    // 创建上线文
    CGContextRef ref = UIGraphicsGetCurrentContext();

    for (int i = 0 ; i < [self.totalPoints count]; i++) {
        for (int j = 0; j < [self.totalPoints[i] count]; j++) {
            NSArray *array = self.totalPoints[i];
            CGPoint pos = [array[j] CGPointValue];
            if (j == 0) {
                // 线的起点
                CGContextMoveToPoint(ref, pos.x, pos.y);
            }else{
                // 连线
                CGContextAddLineToPoint(ref, pos.x, pos.y);
            }
        }
    }
    // 防止线条宽度第一次为0，第一次赋值为1
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _lineWight = 1;
    });

    self.color = [[ColorArray alloc]init];
    NSArray *ca = self.color.colorTotal[self.lineColor];
    // 线条的颜色
    CGContextSetRGBStrokeColor(ref, [ca[1] floatValue], [ca[2] floatValue], [ca[3] floatValue], 1);
    // 线的宽度
    CGContextSetLineWidth(ref, _lineWight);
    // 线头是圆角
    CGContextSetLineCap(ref, kCGLineCapRound);
    //  两线连接是圆角
    CGContextSetLineJoin(ref, kCGLineJoinRound);
    // 绘图
    CGContextStrokePath(ref);
}

@end
