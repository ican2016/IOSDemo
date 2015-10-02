//
//  PaintView.h
//  01-涂鸦
//
//  Created by Apple-JF on 15/10/1.
//  Copyright © 2015年 DF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaintView : UIView

- (void)clearEmpty;
- (void)back;
- (void)save;

@property (assign, nonatomic) int lineWight;
@property (assign, nonatomic) int lineColor;

@end
