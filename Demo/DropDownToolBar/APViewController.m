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
    self.navController = (APNavigationController*)self.navigationController;
    self.navController.activeNavigationBarTitle = @"Tool bar visible";
    self.navController.activeBarButtonTitle = @"Hide";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didSelectShow:(id)sender
{
    self.navController.dropDownToolbar.items = ({
        @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
          [[UIBarButtonItem alloc]   initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editClicked:)],
          [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionClicked:)]];
    });
    if(self.navController.isDropDownVisible){
        [self.navController hideDropDown:sender];
    }
    else{
        [self.navController showDropDown:sender];
    }
    // Can also toggle toolbar from current state
    // [self.navController toggleToolbar:sender];
}

- (void)editClicked:(id)sender
{
    NSLog(@"Edit clicked");
}

- (void)actionClicked:(id)sender
{
    NSLog(@"Action clicked");
}

@end
