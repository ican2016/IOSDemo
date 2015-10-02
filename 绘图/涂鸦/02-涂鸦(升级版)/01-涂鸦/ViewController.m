//
//  ViewController.m
//  01-涂鸦
//
//  Created by Apple-JF on 15/10/1.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "ViewController.h"
#import "PaintView.h"
#import "ColorArray.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

- (IBAction)clearEmpty:(UIButton *)sender;
- (IBAction)back:(UIButton *)sender;
- (IBAction)save:(UIButton *)sender;
- (IBAction)lineWight:(UISlider *)sender;

@property (weak, nonatomic) IBOutlet UIPickerView *fontColor;
@property (weak, nonatomic) IBOutlet PaintView *pointView;
@property(nonatomic ,strong) NSArray *colorTotal;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fontColor.dataSource = self;
    self.fontColor.delegate = self;
    ColorArray *colors = [[ColorArray alloc]init];
    self.colorTotal = colors.colorTotal;
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.colorTotal count];
}
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    self.pointView.lineColor = (int)row;
    NSArray *ar = [self.colorTotal objectAtIndex:row];
    return ar[0];
}

- (IBAction)clearEmpty:(UIButton *)sender {
    [self.pointView clearEmpty];
}

- (IBAction)back:(UIButton *)sender {
    [self.pointView back];
}

- (IBAction)save:(UIButton *)sender {
    [self.pointView save];
}

- (IBAction)lineWight:(UISlider *)sender {
    self.pointView.lineWight = sender.value;
}


@end
