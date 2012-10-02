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

@end
