//
//  MCLocationManager.m
//  MCLocationManager
//
//  Created by mylcode on 2018/1/2.
//  Copyright © 2018年 mylcode. All rights reserved.
//

#import "MCLocationManager.h"
#import <MCLogger/MCLogger.h>

NSString * const kDidLocationUpdateNotification = @"DidLocationUpdateNotificationKey";
NSString * const kDidLocationFailNotification = @"DidLocationFailNotificationKey";

@interface MCLocationManager () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationMgr;

@end

@implementation MCLocationManager

#pragma mark - Singleton

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}

+ (instancetype)defaultManager {
    return [[self alloc] init];
}

+ (instancetype)copyWithZone:(struct _NSZone *)zone {
    return [[self alloc] init];
}

+ (instancetype)mutableCopyWithZone:(struct _NSZone *)zone {
    return [[self alloc] init];
}

- (instancetype)copyWithZone:(struct _NSZone *)zone {
    return self;
}

- (instancetype)mutableCopyWithZone:(struct _NSZone *)zone {
    return self;
}

#pragma mark - Methods

- (CLLocationManager *)locationMgr {
    if (!_locationMgr) {
        _locationMgr = [[CLLocationManager alloc] init];
        _locationMgr.distanceFilter = 100;
        _locationMgr.delegate = self;
        if([CLLocationManager locationServicesEnabled]
           && [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [_locationMgr requestWhenInUseAuthorization];
            });
        }
    }
    return _locationMgr;
}

- (void)startLocation {
    [self.locationMgr startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [[NSNotificationCenter defaultCenter] postNotificationName:kDidLocationUpdateNotification object:locations.firstObject];
    MCLogInfo(@"定位成功：%@", locations);
    if(self.locationType == MCLocationStopWhenUpdated) {
        [self.locationMgr stopUpdatingLocation];
        MCLogInfo(@"定位已停止");
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    MCLogError(@"%@", error);
    [[NSNotificationCenter defaultCenter] postNotificationName:kDidLocationFailNotification object:error.localizedDescription];
}

@end
