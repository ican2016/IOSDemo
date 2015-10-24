//
//  DressView.m
//  ScrollViewDemo
//
//  Created by Apple-JF on 15/10/19.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "DressView.h"

@interface DressView()
@property (strong, nonatomic) IBOutlet UIScrollView *ScrollViwe;

@end

@implementation DressView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
//        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nz1.jpg"]];
//        image.frame = CGRectMake(0, 0, 100, 100);
//        [self.ScrollViwe addSubview:image];
        
        self.ScrollViwe.backgroundColor = [UIColor redColor];
    }
    return self;
}

@end
