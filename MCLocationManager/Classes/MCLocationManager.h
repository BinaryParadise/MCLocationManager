//
//  MCLocationManager.h
//  MCLocationManager
//
//  Created by mylcode on 2018/1/2.
//  Copyright © 2018年 mylcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCLocationManager : NSObject

+ (instancetype)defaultManager;

/**
 启动定位
 */
- (void)startLocation;

@end
