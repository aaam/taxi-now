//
//  LocationController.h
//  TaxiNow
//
//  Created by BRIAN MURPHY on 10/28/12.
//  Copyright (c) 2012 MurphWare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationController  : NSObject <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;}

// Why is implementation incomplete if I include
//- (void) didUpdateToLocation;
// here?

- (void) startUpdatingLocation;

//- (void) findLocation;

@property (strong, nonatomic) CLLocationManager *locationManager;

@property (strong, nonatomic) CLLocation *currentLocation;

@end
