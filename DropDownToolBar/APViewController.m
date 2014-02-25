//
//  APViewController.m
//  DropDownToolBar
//
//  Created by Ankur Patel on 2/24/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

#import "APViewController.h"
#import "APNavigationController.h"

@interface APViewController ()

@end

@implementation APViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationController.toolbar.items =
        @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
          [[UIBarButtonItem alloc]   initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:nil],
[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didSelectShow:(id)sender
{
    APNavigationController *navController = (APNavigationController*)self.navigationController;
    [navController toggleToolbar:sender];
}

@end
