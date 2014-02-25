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
@property (nonatomic, retain) NSString *currentTitle;

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
    self.toolbar = [[APToolbar alloc] init];
    self.toolbar.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);
    self.toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.navigationBar insertSubview:self.toolbar atIndex:0];
    self.currentTitle = self.navigationBar.topItem.title;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toggleToolbar:(id)sender
{
    UIBarButtonItem *item = (UIBarButtonItem*)sender;
    __weak APNavigationController *weakSelf = self;
    if (self.isVisible) {
        CGRect frame = self.toolbar.frame;
        frame.origin.y = self.navigationBar.frame.size.height;
        self.toolbar.frame = frame;
        [UIView animateWithDuration:0.25 animations:^{
            CGRect frame = self.toolbar.frame;
            frame.origin.y = 0.;
            weakSelf.toolbar.frame = frame;
        } completion:^(BOOL finished) {
            weakSelf.isVisible = !weakSelf.isVisible;
            weakSelf.toolbar.hidden = YES;
        }];
        self.navigationBar.topItem.title = self.currentTitle;
        [item setTitle:@"Show"];
    } else {
        CGRect frame = self.toolbar.frame;
        frame.origin.y = 0.;
        self.toolbar.hidden = NO;
        self.toolbar.frame = frame;
        [UIView animateWithDuration:0.25 animations:^{
            CGRect frame = self.toolbar.frame;
            frame.origin.y = self.navigationBar.frame.size.height;
            weakSelf.toolbar.frame = frame;
        } completion:^(BOOL finished) {
            weakSelf.isVisible = !weakSelf.isVisible;
        }];
        self.navigationBar.topItem.title = @"";
        [item setTitle:@"Hide"];
    }
}

@end
