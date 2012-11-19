//
//  TaxiNowMainViewController.m
//  TaxiNow
//
//  Created by BRIAN MURPHY on 10/1/12.
//  Copyright (c) 2012 MurphWare. All rights reserved.
//

#import "TaxiNowMainViewController.h"

@interface TaxiNowMainViewController ()

@end

@implementation TaxiNowMainViewController
@synthesize coordinates, locationController;
@synthesize messageController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    locationController = [[LocationController alloc] init];
    [locationController startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(TaxiNowFlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

// Switch to FlipsideView
- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
//        self.flipsidePopoverController.emailAddress = @"blah@test.com";
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}


// This is the callTaxi button implementation
- (IBAction)callTaxi:(UIButton *)sender { 
    
    // Send lat and long to label
    NSNumber *lat = [NSNumber numberWithDouble: locationController.currentLocation.coordinate.latitude];
    NSNumber *long_ = [NSNumber numberWithDouble: locationController.currentLocation.coordinate.longitude];
    NSString *coords = [NSString stringWithFormat:@"%@, %@", lat, long_];
    
    self.coordinates.text = coords;
    
    // Send lat and long to email view
//    messageController = [[SendLocation alloc] init];
//    messageController.mailComposeDelegate = self;
    [messageController sendMessage];
    
////    presentModalViewController works from here, but not from sendLocation.m - why?
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
//    controller.mailComposeDelegate = self;
    if (controller) [self presentModalViewController:controller animated:YES];
    
}

- (void)viewDidUnload {
    [self setCoordinates:nil];
    [super viewDidUnload];
}
@end
