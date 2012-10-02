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

- (void)awakeFromNib
{
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 480.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
