//
//  TaxiNowMainViewController.h
//  TaxiNow
//
//  Created by BRIAN MURPHY on 10/1/12.
//  Copyright (c) 2012 MurphWare. All rights reserved.
//

#import "TaxiNowFlipsideViewController.h"
#import "LocationController.h"
//#import "SendLocation.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface TaxiNowMainViewController : UIViewController <TaxiNowFlipsideViewControllerDelegate, UIPopoverControllerDelegate, MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

// This is the callTaxi button interface
- (IBAction)callTaxi:(UIButton *)sender;
- (IBAction)sendMessage:(UIButton *)sender;

// This is the text label output interface
@property (weak, nonatomic) IBOutlet UILabel *coordinatesLabel;
//@property (weak, nonatomic) IBOutlet UITextView *coordinatesLabel;

// Do these line violate MVC (controller declared in view)?
@property (strong, nonatomic) LocationController *locationController;
@property (strong, nonatomic) SendLocation *messageController;

@property (strong, nonatomic) NSString *coordinatesString;
@property (strong, nonatomic) NSString *email;


@end

