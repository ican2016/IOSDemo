//
//  ViewController.m
//  TableViewCellDemo
//
//  Created by Renning on 15/10/21.
//  Copyright © 2015年 Renning. All rights reserved.
//

#import "ViewController.h"
#import "CollectionCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSString* identifier;
}

@property (strong, nonatomic)UICollectionView *collectionView;

@end

@implementation ViewController


- (void)viewDidLoad {
    identifier = @"cell";
    [super viewDidLoad];
    // 设置item的大小，颜色
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    // item的大小
    CGFloat itemW = (self.view.frame.size.width)/2;
    CGFloat itemH = itemW * 2;
    flowLayout.itemSize = CGSizeMake(itemW, itemH);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    // 滑动面积
//    flowLayout.footerReferenceSize = CGSizeMake(1000, 1000);
    
    // 初始化collection
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    
    self.collectionView.backgroundColor = [UIColor grayColor];
    // 滚动方向(左右)
//    self.collectionView.alwaysBounceHorizontal = YES;
    // 滚动方向(上下)
//    self.collectionView.alwaysBounceVertical = YES;
    // 注册
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
    // 添加到视图
    [self.view addSubview:self.collectionView];
    
    // 设置代理
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
   
}

// 设置collectionView 显示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

// 设置返回item的数量
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}
//// 设置item的组数
//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 1;
//}

// item 大小
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"%f",collectionView.frame.size.width / 2);
//    return CGSizeMake((self.view.frame.size.width) / 2, 200);
//}

//// item 边际值
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//}

// 点击
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"=== %lu",indexPath.row);
}

// 是否被选中
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end