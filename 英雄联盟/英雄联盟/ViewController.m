//
//  ViewController.m
//  英雄联盟
//
//  Created by Apple-JF on 15-9-25.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic ,strong) NSArray *heros;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.heros count];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

//    
    NSDictionary *dic = [NSDictionary dictionary];
    dic = self.heros[indexPath.row];
    // 1.定义一个标示，用于区分缓存池中的cell
    static NSString *str = @"cell";
    // 2.去缓存池中拿已存在的cell，如果有直接使用，如果没有，通过底下的方式创建cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
    }
    NSLog(@"%@== %d",dic[@"name"],indexPath.row);
    cell.textLabel.text = dic[@"name"];

    return cell;
}

-(NSArray *)heros
{
    if (!_heros) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"heros.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *muArray = [NSMutableArray array];
        
        for (NSDictionary *dic in array) {
            [muArray addObject:dic];
        }
        _heros = muArray;
    }
    
    return _heros;
}

@end
