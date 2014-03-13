//
//  APNavigationController.m
//  DropDownToolBar
//
//  Created by Ankur Patel on 2/24/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

#import "APNavigationController.h"

@interface APNavigationController ()

@property (nonatomic, assign) BOOL isVisible;
@property (nonatomic, retain) NSString *originalNavigationBarTitle;
@property (nonatomic, retain) NSString *originalBarButtonTitle;

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
    self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    self.toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.navigationBar.superview insertSubview:self.toolbar belowSubview:self.navigationBar];
    self.originalNavigationBarTitle = self.navigationBar.topItem.title;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toggleToolbar:(UIBarButtonItem*)item
{
    __weak APNavigationController *weakSelf = self;
    if (self.isVisible) {
        CGRect frame = self.toolbar.frame;
        frame.origin.y = CGRectGetMaxY(self.navigationBar.frame);
        self.toolbar.frame = frame;
        [UIView animateWithDuration:0.25 animations:^{
            CGRect frame = self.toolbar.frame;
            frame.origin.y = 0.;
            weakSelf.toolbar.frame = frame;
        } completion:^(BOOL finished) {
            weakSelf.isVisible = !weakSelf.isVisible;
            weakSelf.toolbar.hidden = YES;
        }];
        self.navigationBar.topItem.title = self.originalNavigationBarTitle;
        item.title = self.originalBarButtonTitle;
    } else {
        CGRect frame = self.toolbar.frame;
        frame.origin.y = 0.f;
        self.toolbar.hidden = NO;
        self.toolbar.frame = frame;
        self.originalBarButtonTitle = item.title;
        [UIView animateWithDuration:0.25 animations:^{
            CGRect frame = self.toolbar.frame;
            frame.origin.y = CGRectGetMaxY(self.navigationBar.frame);
            weakSelf.toolbar.frame = frame;
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
