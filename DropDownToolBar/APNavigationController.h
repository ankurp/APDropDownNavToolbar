//
//  APNavigationController.h
//  DropDownToolBar
//
//  Created by Ankur Patel on 2/24/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APNavigationController : UINavigationController

@property (nonatomic, retain) UIToolbar *toolbar; // Reference to dynamically change items based on which bar button item is clicked
@property (nonatomic, retain) NSString *activeNavigationBarTitle; // Navigation bar title when the toolbar is shown
@property (nonatomic, retain) NSString *activeBarButtonTitle; // UIBarButton title when toolbar is shown

- (void)setActiveBarButtonTitle:(NSString*)title;
- (void)setActiveNavigationBarTitle:(NSString*)title;
- (void)toggleToolbar:(id)sender;

@end
