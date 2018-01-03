//
//  MCLocationManager.h
//  MCLocationManager
//
//  Created by mylcode on 2018/1/2.
//  Copyright © 2018年 mylcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

//NSNotification.object = <CLLocation *>
FOUNDATION_EXPORT NSString * const kDidLocationUpdateNotification;    //GPS定位信息改变的通知

typedef NS_OPTIONS(NSUInteger, MCLocationType) {
    MCLocationStopWhenUpdated = 0,  //定位成功后停止
    MCLocationAlways = 0,   //一直定位
};

@interface MCLocationManager : NSObject

/**
 定位类型，默认为MCLocationStopWhenUpdated
 */
@property (nonatomic, assign) MCLocationType locationType;

+ (instancetype)defaultManager;

/**
 启动定位
 */
- (void)startLocation;

@end
