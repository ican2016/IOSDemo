//
//  Other.m
//  post）
//
//  Created by Apple-JF on 15/10/14.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "Other.h"
@interface Other()<NSURLConnectionDataDelegate>
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *pass;
@property (strong, nonatomic) NSMutableData *data;

@end

@implementation Other

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (IBAction)login:(id)sender {
    
    NSLog(@"get");
    NSString *str = [NSString stringWithFormat:@"http://localhost:63342/Sites/ios/other/findOne.php?u_account=%@&u_password=%@",self.name.text,self.pass.text];
    NSURL *url = [NSURL URLWithString:str];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    
    NSURLConnection *connetion = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
    
    [connetion start];
    
}
// load work
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if (!self.data) {
        self.data = [NSMutableData data];
    }else{
        [self.data setData:nil];
    }
}

// join data
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}

// lunach work
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *str = [[NSString alloc]initWithData:self.data encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@   －connectionDidFinishLoading－",str);
}

// out error
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // write error info
    NSLog(@"%@",error.localizedDescription);
}

@end
