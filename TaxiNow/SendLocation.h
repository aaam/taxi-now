//
//  SendLocation.h
//  TaxiNow
//
//  Created by BRIAN MURPHY on 10/30/12.
//  Copyright (c) 2012 MurphWare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface SendLocation : UIViewController <MFMailComposeViewControllerDelegate>

@property (copy, nonatomic) NSString *emailAddress;

- (void) sendMessage: (id)sender;

@end
