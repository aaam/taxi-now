//
//  TaxiNowFlipsideViewController.h
//  TaxiNow
//
//  Created by BRIAN MURPHY on 10/1/12.
//  Copyright (c) 2012 MurphWare. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TaxiNowFlipsideViewController;

@protocol TaxiNowFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(TaxiNowFlipsideViewController *)controller;
@end

@interface TaxiNowFlipsideViewController : UIViewController

@property (weak, nonatomic) id <TaxiNowFlipsideViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *emailAddress;

@property (copy, nonatomic) NSString *userName;

- (IBAction)done:(id)sender;

@end
