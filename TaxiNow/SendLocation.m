//
//  SendLocation.m
//  TaxiNow
//
//  Created by BRIAN MURPHY on 10/30/12.
//  Copyright (c) 2012 MurphWare. All rights reserved.
//

#import "SendLocation.h"

@interface SendLocation ()
@end

@implementation SendLocation

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

//Method stub - designed to allow program to determine how to send message
-(void) sendMessage: (id) sender {
    
//    Send my email only implemented method
    [self sendEmail: sender];
}

- (void) sendEmail: (id) sender {

    NSArray *receipients = @[@"murphman.b@gmail.com"];
//    receipients = @[@"murphman.b@gmail.com"];
    
    
    if ([MFMailComposeViewController canSendMail]) {
        // Show the composer
        MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
        controller.mailComposeDelegate = self;
//        controller.mailComposeDelegate = sender;
        [controller setToRecipients: receipients];
        [controller setSubject:@"My Subject"];
        [controller setMessageBody:@"Hello there." isHTML:NO];
        if (controller) [self presentModalViewController:controller animated:YES];
//        MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
//        controller.mailComposeDelegate = self;
//        [controller setSubject:@"In app email..."];
//        [controller setMessageBody:@"...a tutorial from mobileorchard.com" isHTML:NO];
//        [self presentModalViewController:controller animated:YES];
    } else {
        // Handle the error
        NSLog(@"Device is unable to send email in its current state.");
    }
    
}

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
    if (result == MFMailComposeResultSent) {
        NSLog(@"It's away!");
    }
    [self dismissModalViewControllerAnimated:YES];
}


@end
