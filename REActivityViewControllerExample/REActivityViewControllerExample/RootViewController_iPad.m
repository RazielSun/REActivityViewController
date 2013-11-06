//
//  RootViewController_iPad.m
//  REActivityViewControllerExample
//
//  Created by Roman Efimov on 1/24/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "RootViewController_iPad.h"
#import "REActivityViewController.h"

@implementation RootViewController_iPad

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(buttonPressed)];
	self.navigationItem.rightBarButtonItem = buttonItem;
}

- (void)buttonPressed
{    
    if (_activityPopoverController && _activityPopoverController.isPopoverVisible) {
        [_activityPopoverController dismissPopoverAnimated:YES];
        _activityPopoverController =  nil;
        return;
    }
    
    // Create some custom activity
    //
    REActivity *customActivity = [[REActivity alloc] initWithTitle:@"Custom"
                                                             image:[UIImage imageNamed:@"REActivityViewController.bundle/Icon_Custom"]
                                                       actionBlock:^(REActivity *activity, REActivityViewController *activityViewController) {
                                                           [activityViewController dismissViewControllerAnimated:YES completion:^{
                                                               NSLog(@"Info: %@", activityViewController.userInfo);
                                                           }];
                                                       }];
    
    // Compile activities into an array, we will pass that array to
    // REActivityViewController on the next step
    //
    NSArray *activities = @[customActivity];
    
    // Create REActivityViewController controller and assign data source
    //
    REActivityViewController *activityViewController = [[REActivityViewController alloc] initWithViewController:self activities:activities];
    activityViewController.userInfo = @{
                                        @"image": [UIImage imageNamed:@"Flower.jpg"],
                                        @"text": @"Hello world!",
                                        @"url": [NSURL URLWithString:@"https://github.com/romaonthego/REActivityViewController"],
                                        @"coordinate": @{@"latitude": @(37.751586275), @"longitude": @(-122.447721511)}
                                        };
    
    // Present it from UIPopoverController
    //
    _activityPopoverController = [[UIPopoverController alloc] initWithContentViewController:activityViewController];
    activityViewController.presentingPopoverController = _activityPopoverController;
    [_activityPopoverController presentPopoverFromBarButtonItem:self.navigationItem.rightBarButtonItem
                                       permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

#pragma mark -
#pragma mark Orientation

- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

@end
