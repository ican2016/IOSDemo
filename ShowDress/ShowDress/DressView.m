//
//  DressView.m
//  ShowDress
//
//  Created by Apple-JF on 15/10/21.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "DressView.h"
#import "Dress.h"

@interface DressView()


@property (strong, nonatomic) IBOutlet UIScrollView *scollectionView;
@property (strong, nonatomic) IBOutlet UILabel *dressName;
@property (strong, nonatomic) IBOutlet UILabel *currentPrice;
@property (strong, nonatomic) IBOutlet UILabel *price;

@end


@implementation DressView

- (void)setDress:(Dress *)dress
{
    _dress = dress;
    int imageCount = (int)_dress.imageList.count;
    for (int i = 0; i < imageCount; i++) {
        self.scollectionView.contentSize = CGSizeMake(self.scollectionView.bounds.size.width * i, self.scollectionView.bounds.size.height);
        self.scollectionView.pagingEnabled = YES;
        self.scollectionView.showsHorizontalScrollIndicator = NO;
        self.scollectionView.showsVerticalScrollIndicator = NO;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.scollectionView.frame];
        imageView.image = [UIImage imageNamed:_dress.imageList[i]];
        NSLog(@"%@",_dress.imageList[i]);
        [self.scollectionView addSubview:imageView];
    }
    self.dressName.text = _dress.dressName;
    self.currentPrice.text = [NSString stringWithFormat:@"%d",_dress.currentPrice];
    self.price.text = [NSString stringWithFormat:@"%d",_dress.price];
}

@end
