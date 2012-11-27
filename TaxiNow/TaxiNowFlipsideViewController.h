//
//  TaxiNowFlipsideViewController.h
//  TaxiNow
//
//  Created by BRIAN MURPHY on 10/1/12.
//  Copyright (c) 2012 MurphWare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SendLocation.h"

@class TaxiNowFlipsideViewController;

@protocol TaxiNowFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(TaxiNowFlipsideViewController *)controller;
@end

// UITextFieldDelegate must be added for keyboad to disappear on Return
@interface TaxiNowFlipsideViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) id <TaxiNowFlipsideViewControllerDelegate> delegate;

// For this to work, textField must be Ctrl-Dragged to Controller in
// Storyboad; select outlet delegate
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)done:(id)sender;

@end
