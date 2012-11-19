//
//  TaxiNowFlipsideViewController.m
//  TaxiNow
//
//  Created by BRIAN MURPHY on 10/1/12.
//  Copyright (c) 2012 MurphWare. All rights reserved.
//

#import "TaxiNowFlipsideViewController.h"

@interface TaxiNowFlipsideViewController ()

@end

@implementation TaxiNowFlipsideViewController
@synthesize textField;
@synthesize sendLocation;
//@ synthesize emailAddress;

- (void)awakeFromNib
{
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 480.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    NSLog(@"%@", self.emailAddress);
    sendLocation = [[SendLocation alloc] init];
    NSLog(@"%@", sendLocation.emailAddress);
//    self.textField.text = sendLocation.emailAddress;
    self.textField.text = @"blah@test.com";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
    if (theTextField == self.textField) {
        [theTextField resignFirstResponder];
        
    }
    return YES;
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    // Save textField value as emailAddress
    // TODO: send emailAddress to SendLocation?
//    self.emailAddress = self.textField.text;
    sendLocation.emailAddress = self.textField.text;
    NSLog(@"Address entered - %@", sendLocation.emailAddress);
    
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (void)viewDidUnload {
//    [self setEmailAddress:nil];
    [self setTextField:nil];
    [super viewDidUnload];
}
@end
