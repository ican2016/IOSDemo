//
//  ViewController.m
//  网络Demo
//
//  Created by Apple-JF on 15/10/8.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "ViewController.h"
#import "UserWithModel.h"
#import "User.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *promptMessageLabel;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *userData;

- (IBAction)loginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [UserWithModel queryAllUser:^(id data) {
        self.userData = data;
    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.userData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"user";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    User *user = self.userData[indexPath.row];
    cell.textLabel.text =  user.u_account;

    return cell;
}

- (IBAction)loginButton {
    
    [UserWithModel quaryUserWithAccount:self.accountTextField.text andUserPassword:self.passwordTextField.text andData:^(id data) {
       
        NSDictionary *dic = data;
        if ([@"lisi" isEqualToString:dic[@"userAccount"]] && [@"123" isEqualToString:dic[@"userPassword"]]) {
            self.promptMessageLabel.textColor = [UIColor orangeColor];
            self.promptMessageLabel.text = @"可以正常登录！";
        }else{
        
            [UserWithModel addUserWithAccount:self.accountTextField.text andUserPassword:self.passwordTextField.text andData:^(NSString * data) {
   
                    self.promptMessageLabel.textColor = [UIColor redColor];
                    self.promptMessageLabel.text = data;
            }];
            return;
        }
    }];
    

    [self.tableView reloadData];

}


//－－－－－－－－－随机数－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
- (void)data
{
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i<100; i++) {
        NSArray *array = @[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"H",@"i",@"k"];
        NSString *str1 = [NSString stringWithFormat:@"%@%@%@%@",array[arc4random()%10],array[arc4random()%10],array[arc4random()%10],array[arc4random()%10]];
        NSString *str2 = [NSString stringWithFormat:@"%@%@%@%@",array[arc4random()%10],array[arc4random()%10],array[arc4random()%10],array[arc4random()%10]];
        NSString *sql = [NSString stringWithFormat:@"insert into temp(t1,t2) values('%@','%@');",str1,str2];
        [mArray addObject:sql];
    }
    NSLog(@"%@",mArray);
    [mArray writeToFile:@"/Users/apple/tmp.sql" atomically:NO];
}
@end
