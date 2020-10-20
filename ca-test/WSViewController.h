//
//  WSViewController.h
//  ca-test
//
//  Created by Wolfram Schroers on 11/30/11.
//  Copyright (c) 2011 Numerik & Analyse Schroers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "WSTestView.h"

@interface WSViewController : UIViewController

@property (nonatomic, strong) UILabel *myLabel;
@property (nonatomic, strong) WSTestView *myTestView;
@property NSInteger myCounter;

- (void)callMe:(NSTimer *)sender;

@end
