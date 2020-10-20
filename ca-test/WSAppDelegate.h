//
//  WSAppDelegate.h
//  ca-test
//
//  Created by Wolfram Schroers on 11/30/11.
//  Copyright (c) 2011 Numerik & Analyse Schroers. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WSViewController;

@interface WSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) WSViewController *viewController;

@end
