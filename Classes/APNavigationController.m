//
//  APNavigationController.m
//  DropDownToolBar
//
//  Created by Ankur Patel on 2/24/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

#import "APNavigationController.h"

@interface APNavigationController ()

@property (nonatomic, copy) NSString *originalNavigationBarTitle;
@property (nonatomic, copy) NSString *originalBarButtonTitle;

@end

@implementation APNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.dropDownToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    self.dropDownToolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.dropDownToolbar.tintColor = self.navigationBar.tintColor;
    [self.navigationBar.superview insertSubview:self.dropDownToolbar belowSubview:self.navigationBar];
    self.originalNavigationBarTitle = self.navigationBar.topItem.title;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toggleToolbar:(UIBarButtonItem*)item
{
    if (self.isVisible) {
        [self hideToolbar:item];
    } else {
        [self showToolbar:item];
    }
}

- (void)hideToolbar:(UIBarButtonItem *)item
{
    if(self.isVisible){
        __weak APNavigationController *weakSelf = self;
        CGRect frame = self.dropDownToolbar.frame;
        frame.origin.y = CGRectGetMaxY(self.navigationBar.frame);
        self.dropDownToolbar.frame = frame;
        [UIView animateWithDuration:0.25 animations:^{
            CGRect frame = self.dropDownToolbar.frame;
            frame.origin.y = 0.;
            weakSelf.dropDownToolbar.frame = frame;
        } completion:^(BOOL finished) {
            weakSelf.isVisible = !weakSelf.isVisible;
            weakSelf.dropDownToolbar.hidden = YES;
        }];
        self.navigationBar.topItem.title = self.originalNavigationBarTitle;
        item.title = self.originalBarButtonTitle;
    }
}

- (void)showToolbar:(UIBarButtonItem *)item
{
    if(!self.isVisible){
        __weak APNavigationController *weakSelf = self;
        CGRect frame = self.dropDownToolbar.frame;
        frame.origin.y = 0.f;
        self.dropDownToolbar.hidden = NO;
        self.dropDownToolbar.frame = frame;
        self.originalBarButtonTitle = item.title;
        [UIView animateWithDuration:0.25 animations:^{
            CGRect frame = self.dropDownToolbar.frame;
            frame.origin.y = CGRectGetMaxY(self.navigationBar.frame);
            weakSelf.dropDownToolbar.frame = frame;
        } completion:^(BOOL finished) {
            weakSelf.isVisible = !weakSelf.isVisible;
        }];
        if (self.activeNavigationBarTitle) {
            self.navigationBar.topItem.title = self.activeNavigationBarTitle;
        }
        if (self.activeBarButtonTitle) {
            item.title = self.activeBarButtonTitle;
        }
    }
}

@end
