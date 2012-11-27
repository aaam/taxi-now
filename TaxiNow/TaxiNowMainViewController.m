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
@synthesize coordinatesLabel, locationController;
@synthesize messageController;
@synthesize coordinatesString;
@synthesize email;

//Load only runs once
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    locationController = [[LocationController alloc] init];
    [locationController startUpdatingLocation];
}

//Appear runs every time view shows
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(storeEmail:) name:@"EmailSaved" object:nil];
    
}

- (void) storeEmail: (NSString*) theEmail
{
    self.email = theEmail;
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
    
//    [coordinatesLabel setDataDetectorTypes:UIDataDetectorTypeAddress];
    coordinatesString = [NSString stringWithFormat:@"%@, %@", lat, long_];
    coordinatesLabel.text = coordinatesString;
    
}

// Send lat and long to destination
- (IBAction)sendMessage:(UIButton *)sender {
    
    [self sendResults];
    
}

//Method stub - designed to allow program to determine how to send message
-(void) sendResults {
    
    //    Send my email only implemented method
    [self sendEmail];
}

- (void) sendEmail {
    
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
        controller.mailComposeDelegate = self;
    
//        NSArray *recipients = @[@"murphman.b@gmail.com"];
        NSArray *recipients = @[email];
        [controller setToRecipients: recipients];
        [controller setSubject:@"Coordinates"];
        [controller setMessageBody:self.coordinatesString isHTML:YES];
        if (controller) [self presentModalViewController:controller animated:YES];
    }
    else {
        // Handle the error
        NSLog(@"Device is unable to send email in its current state.");
    }
    
}

//Dimiss email view when finished
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
    if (result == MFMailComposeResultSent) {
        NSLog(@"It's away!");
    }
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload {
    [self setCoordinatesLabel:nil];
    [super viewDidUnload];
}
@end
