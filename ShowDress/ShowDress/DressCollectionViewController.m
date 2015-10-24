//
//  DressCollectionViewController.m
//  ShowDress
//
//  Created by Apple-JF on 15/10/21.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "DressCollectionViewController.h"
#import "DressView.h"
#import "Dress.h"

@interface DressCollectionViewController ()

@property (strong, nonatomic)NSArray *dressList;

@end

@implementation DressCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (NSArray *)dressList
{
    if (!_dressList) {
        NSMutableArray *dressArray = [NSMutableArray array];
        NSArray *data = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"DressView" ofType:nil]];
        for (NSDictionary *dic in data) {
            Dress *dress = [Dress dressWithDic:dic];
            [dressArray addObject:dress];
        }
        _dressList = dressArray;
    }
    return _dressList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"DressView" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];

    self.collectionView.backgroundColor = [UIColor whiteColor];
    

}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DressView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    DressView *dressView = [[DressView alloc]init];
    dressView.dress = self.dressList[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat w = self.view.frame.size.width / 2;
    CGFloat h = w * 2;
    return CGSizeMake(w, h);
}

@end
