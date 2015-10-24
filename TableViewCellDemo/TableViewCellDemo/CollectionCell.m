//
//  CollectionCell.m
//  TableViewCellDemo
//
//  Created by Renning on 15/10/21.
//  Copyright © 2015年 Renning. All rights reserved.
//

#import "CollectionCell.h"

@interface CollectionCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation CollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setting];
    }
    return self;
}

- (void)setting
{
    CGFloat cellX = 0;
    CGFloat cellY = 0;
    CGFloat cellW = self.frame.size.width / 2;
    CGFloat cellH = 200;
    self.frame = CGRectMake(cellX, cellY, cellW, cellH);
    self.backgroundColor = [UIColor redColor];
}
@end
