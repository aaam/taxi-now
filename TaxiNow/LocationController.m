//
//  LocationController.m
//  TaxiNow
//
//  Created by BRIAN MURPHY on 10/28/12.
//  Copyright (c) 2012 MurphWare. All rights reserved.
//

#import "LocationController.h"

@interface LocationController ()

@end
@implementation LocationController
@synthesize locationManager, currentLocation;

- (id)init
{
    if (self = [super init]) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.delegate = self;
    }
    return self;
}

- (void) startUpdatingLocation
{
    [locationManager startUpdatingLocation];
}

// didUpdateToLocation for pre-iOS 6
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
        
    NSLog(@"didUpdate");
    self.currentLocation = newLocation;
    
    if(newLocation.horizontalAccuracy <= 15.0f)
    { [locationManager stopUpdatingLocation]; }
    
    NSLog(@"lat = %f, long = %f", self.currentLocation.coordinate.latitude, self.currentLocation.coordinate.longitude);
}

// didUpdateLocations for iOS 6
// Delegate method from the CLLocationManagerDelegate protocol.

- (void)locationManager:(CLLocationManager *)manager

     didUpdateLocations:(NSArray *)locations {
    
    // If it's a relatively recent event, turn off updates to save power
    
    self.currentLocation = [locations lastObject];
    NSDate* eventDate = currentLocation.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    
    if (abs(howRecent) < 15.0) {
        
        // If the event is recent, do something with it.
        
        NSLog(@"latitude %+.6f, longitude %+.6f\n",
              currentLocation.coordinate.latitude,
              currentLocation.coordinate.longitude);
        NSLog(@"%@", locations[0]);
        
    }
    
//    Stop updating location when desired accuracy achieved
    if(currentLocation.horizontalAccuracy <= 15.0f)
        {
            [locationManager stopUpdatingLocation];
        }
    
}

// Error message delegate
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
    if(error.code == kCLErrorDenied) {
        [locationManager stopUpdatingLocation];
    } else if(error.code == kCLErrorLocationUnknown) {
        // retry
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error retrieving location"
                               message:[error description]
                               delegate:nil
                               cancelButtonTitle:@"OK"
                               otherButtonTitles:nil];
        [alert show];
    }    
}

@end
