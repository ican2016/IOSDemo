//
//  StudentCondition.m
//  01-SQLite基本操作
//
//  Created by Apple-JF on 15/10/5.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "StudentCondition.h"
#import "StudentWithTool.h"
#import "Student.h"

@interface StudentCondition() <UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property (strong, nonatomic)NSArray *studentArray ;

@end

@implementation StudentCondition

// 懒加载数据
- (NSArray *)studentArray
{
    if (!_studentArray) {
        _studentArray = [StudentWithTool queryStudent];
    }
    return _studentArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    searchBar.delegate = self;
    self.tableView.tableHeaderView = searchBar;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.studentArray count];
}

// tableviewCell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"student";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    Student *student = self.studentArray[indexPath.row];
    cell.textLabel.text = student.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",student.age];
    return cell;
}

// 实时监控搜索栏的变换
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    // 覆盖tableview中原先的值
    self.studentArray = [StudentWithTool queryStudentWithQuestion:searchText];
    // 更新整个tableView
    [self.tableView reloadData];
}

@end
