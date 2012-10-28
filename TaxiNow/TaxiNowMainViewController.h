//
//  TaxiNowMainViewController.h
//  TaxiNow
//
//  Created by BRIAN MURPHY on 10/1/12.
//  Copyright (c) 2012 MurphWare. All rights reserved.
//

#import "TaxiNowFlipsideViewController.h"

@interface TaxiNowMainViewController : UIViewController <TaxiNowFlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

// This is the callTaxi button interface
- (IBAction)callTaxi:(UIButton *)sender;

// This is the text label output interface
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@interface CurrentLocation  : NSObject <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;}

- (void)locationManager:(CLLocationManager *)manager
didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;

- (void) findLocation;

@property (strong, nonatomic) CLLocationManager *locationManager;

@property (strong, nonatomic) CLLocation *currentLocation;
@end
