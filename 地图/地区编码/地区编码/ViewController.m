//
//  ViewController.m
//  地区编码
//
//  Created by Apple-JF on 15/10/3.
//  Copyright © 2015年 DF. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()

@property (strong, nonatomic)CLGeocoder *geocoder;

@end

@implementation ViewController

- (CLGeocoder *)geocoder
{
    if (!_geocoder) {
        _geocoder = [[CLGeocoder alloc]init];
    }
    return _geocoder;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%d",self.geocoder.geocoding); // 这句一定要添加

    [self getCoorinateAddress:@"杨凌"];
    [self getAddressWith:39.54 andLongitude:116.28];
}

// 通过指明的地区获取地区编码，以及其他属性
- (void)getCoorinateAddress:(NSString *)addressName
{
   
    [_geocoder geocodeAddressString:addressName completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error) {
            NSLog(@"1");
        }else{
            // 取出第一个地标
            CLPlacemark *placemark = [placemarks firstObject];
            
            // 在地标中解析数据
            CLLocation *location = placemark.location;
            CLRegion *region = placemark.region;
            NSDictionary *addressAdr = placemark.addressDictionary;
            
            //                NSString *name=placemark.name;//地名
//                            NSString *thoroughfare=placemark.thoroughfare;//街道
            //                NSString *subThoroughfare=placemark.subThoroughfare; //街道相关信息，例如门牌等
            //                NSString *locality=placemark.locality; // 城市
            //                NSString *subLocality=placemark.subLocality; // 城市相关信息，例如标志性建筑
            //                NSString *administrativeArea=placemark.administrativeArea; // 州
            //                NSString *subAdministrativeArea=placemark.subAdministrativeArea; //其他行政区域信息
            //                NSString *postalCode=placemark.postalCode; //邮编
            //                NSString *ISOcountryCode=placemark.ISOcountryCode; //国家编码
//                            NSString *country=placemark.country; //国家
            //                NSString *inlandWater=placemark.inlandWater; //水源、湖泊
            //                NSString *ocean=placemark.ocean; // 海洋
            //                NSArray *areasOfInterest=placemark.areasOfInterest; //关联的或利益相关的地标
            
            NSLog(@"%@",location);
            NSLog(@"%@",region);
            NSLog(@"%@",addressAdr);
  
        }
    }];
}

// 通过坐标点获取地址位置
- (void)getAddressWith:(CLLocationDegrees)latitude andLongitude:(CLLocationDegrees)longitude
{
    // 获取坐标点
    CLLocation *location = [[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
    
    [_geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        // 取出第一个地标
        CLPlacemark *placemark = [placemarks firstObject];
        NSLog(@"详细信息%@",placemark.addressDictionary);
    }];
}

@end
