//
//  MCViewController.m
//  MCLocationManager
//
//  Created by mylcode on 01/02/2018.
//  Copyright (c) 2018 mylcode. All rights reserved.
//

#import "MCViewController.h"
#import <MCLocationManager/MCLocationManager.h>

@interface MCViewController ()

@end

@implementation MCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didLocationFinished:) name:kDidLocationUpdateNotification object:nil];
    [[MCLocationManager defaultManager] startLocation];
}

- (void)didLocationFinished:(NSNotification *)noti {
    CLLocation *location = noti.object;
    
    NSLog(@"定位成功：%f, %f", location.coordinate.longitude, location.coordinate.latitude);
}

@end
