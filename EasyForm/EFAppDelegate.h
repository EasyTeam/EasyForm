//
//  EFAppDelegate.h
//  EasyForm
//
//  Created by Lei Sun on 1/11/13.
//  Copyright (c) 2013 EasyTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EFMainViewController;

@interface EFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;

@property (strong, nonatomic) EFMainViewController *mainViewController;

@end
