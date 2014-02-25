//
//  APViewController.h
//  DropDownToolBar
//
//  Created by Ankur Patel on 2/24/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APNavigationController.h"

@interface APViewController : UIViewController

@property (nonatomic, retain) APNavigationController *navController;

- (IBAction)didSelectShow:(id)sender;

@end
