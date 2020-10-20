//
//  WSAppDelegate.m
//  ca-test
//
//  Created by Wolfram Schroers on 11/30/11.
//  Copyright (c) 2011 Numerik & Analyse Schroers. All rights reserved.
//

#import "WSAppDelegate.h"

#import "WSViewController.h"

@implementation WSAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[WSViewController alloc] initWithNibName:@"WSViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
