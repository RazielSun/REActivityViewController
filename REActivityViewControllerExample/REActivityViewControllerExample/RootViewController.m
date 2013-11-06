//
//  RootViewController.m
//  REActivityViewControllerExample
//
//  Created by Roman Efimov on 1/24/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "RootViewController.h"
#import "REActivityViewController.h"

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20, 20, 280, 44);
    [button setTitle:@"Show REActivityViewController" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonPressed
{
    // Prepare activities
    //
    REFacebookActivity *facebookActivity = [[REFacebookActivity alloc] init];
    RETwitterActivity *twitterActivity = [[RETwitterActivity alloc] init];
    REVKActivity *vkActivity = [[REVKActivity alloc] initWithClientId:@"3396235"];
    REChromeActivity *chromeActivity = [[REChromeActivity alloc] init];
    RESaveToCameraRollActivity *saveToCameraRollActivity = [[RESaveToCameraRollActivity alloc] init];
    
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
    NSArray *activities = @[facebookActivity, twitterActivity, vkActivity, chromeActivity,
                            saveToCameraRollActivity, customActivity];
    
    // Create REActivityViewController controller and assign data source
    //
    REActivityViewController *activityViewController = [[REActivityViewController alloc] initWithViewController:self activities:activities];
    activityViewController.userInfo = @{
                                        @"image": [UIImage imageNamed:@"Flower.jpg"],
                                        @"text": @"Hello world!",
                                        @"url": [NSURL URLWithString:@"https://github.com/romaonthego/REActivityViewController"],
                                        @"coordinate": @{@"latitude": @(37.751586275), @"longitude": @(-122.447721511)}
                                        };
    
    [activityViewController presentFromRootViewController];
}

#pragma mark -
#pragma mark Orientation

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscape;
    //return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate
{
    return YES;
    //return NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    return YES;
    //return (orientation == UIInterfaceOrientationPortrait);
}

@end
