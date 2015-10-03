//
//  ViewController.m
//  02-location基本
//
//  Created by Apple-JF on 15/10/3.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "ViewController.h"
#import  <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>

@property (strong, nonatomic)CLLocationManager *localManager;

@end

@implementation ViewController


- (CLLocationManager *)localManager
{
    if (!_localManager) {
        self.localManager = [[CLLocationManager alloc]init];
        self.localManager.delegate = self;
    }
    return _localManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 如果没有打开允许导航，不执行以下代码
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"open location");
        return ;
    }
    self.localManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.localManager.distanceFilter = 10;
    // 始终允许访问导航
    [self.localManager requestAlwaysAuthorization];
//     在使用期间可以访问导航
    [self.localManager requestWhenInUseAuthorization];
    // 开始更新用户的位置
    [self.localManager startUpdatingLocation];
    
    [self countLineDisstance];
}

// 只要定位到用户位置，就会掉用（掉用频率很高）
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    // 1.取出位置
    CLLocation *loc = [locations lastObject];
    
    // coordinate(坐标)（经纬度）
    NSLog(@"经纬度  %f == %f",loc.coordinate.latitude,loc.coordinate.longitude);
    
    // altitude(海拔)
    NSLog(@"海拔  %f",loc.altitude);
    
    // course (路线，航向)
    NSLog(@"方向  %f",loc.course);
    
    // 航行速度(m/s)
    NSLog(@"速度  %f",loc.speed);

}

// 计算量坐标之差
- (void)countLineDisstance
{
    CLLocation *l1 = [[CLLocation alloc]initWithLatitude:40 longitude:116];
    CLLocation *l2 = [[CLLocation alloc]initWithLatitude:41 longitude:116];
    
    // 亮点坐标之差（直线）
    CLLocationDistance cl = [l1 distanceFromLocation:l2];
    NSLog(@"%f",cl);
    
}


@end
