//
//  EFMainViewController.m
//  EasyForm
//
//  Created by Lei Sun on 1/11/13.
//  Copyright (c) 2013 EasyTeam. All rights reserved.
//

#import "EFMainViewController.h"

@interface EFMainViewController ()

@end

@implementation EFMainViewController

- (id)initWithPlistFile:(NSString*)fileName
{
    self = [super initWithPlistFile:fileName];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View Controller
- (void)dealloc
{
    [super dealloc];
}

- (IBAction)showInfo:(id)sender
{
}

@end
