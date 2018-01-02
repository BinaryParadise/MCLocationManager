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
    
    [[MCLocationManager defaultManager] startLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
