//
//  ViewController.m
//  01-location使用
//
//  Created by Apple-JF on 15/10/3.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>

@property (strong, nonatomic)CLLocationManager *locaM;

@end

@implementation ViewController

-(CLLocationManager *)locaM
{
    if (!_locaM) {
        self.locaM = [[CLLocationManager alloc] init];;
        self.locaM.delegate = self;
    }
    return _locaM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"请打开导航");
        return ;
    }
    
    [self.locaM startUpdatingLocation];
    
}

// NSLocationAlwaysUsageDescription
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *currLocation = [locations lastObject];
    NSLog(@"经度=%f 纬度=%f 高度=%f", currLocation.coordinate.latitude, currLocation.coordinate.longitude, currLocation.altitude);
}

@end
