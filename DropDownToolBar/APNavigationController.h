//
//  APNavigationController.h
//  DropDownToolBar
//
//  Created by Ankur Patel on 2/24/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APToolbar.h"

@interface APNavigationController : UINavigationController

@property (nonatomic, retain) APToolbar *toolbar;

- (void)toggleToolbar:(id)sender;

@end
