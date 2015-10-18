//
//  ViewController.m
//  多线程篇(NSThread)
//
//  Created by Apple-JF on 15/10/14.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *ImageView;
- (IBAction)show:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)show:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"http://localhost/123.jpg"];
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(downloadWithImage:) object:url];
    [thread start];
}

- (void)downloadWithImage:(NSURL *)url
{
    NSData *data = [[NSData alloc]initWithContentsOfURL:url];
    UIImage *image = [[UIImage alloc]initWithData:data];
    [self performSelectorOnMainThread:@selector(updateWithUI:) withObject:image waitUntilDone:YES];
    
}

- (void)updateWithUI:(UIImage *)image
{
    self.ImageView.image = image;
}
@end
