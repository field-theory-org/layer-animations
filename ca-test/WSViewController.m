//
//  WSViewController.m
//  ca-test
//
//  Created by Wolfram Schroers on 11/30/11.
//  Copyright (c) 2011 Numerik & Analyse Schroers. All rights reserved.
//

#import "WSViewController.h"

@implementation WSViewController

@synthesize myLabel = _myLabel;
@synthesize myTestView = _myTestView;
@synthesize myCounter = _myCounter;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    self.myTestView = [[WSTestView alloc] initWithFrame:self.view.frame];
    self.myTestView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.myTestView];
    [self.view addSubview:self.myLabel];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1
                                     target:self
                                   selector:@selector(callMe:)
                                   userInfo:nil
                                    repeats:YES];
    __weak WSViewController *blockSelf = self;
    [UIView animateWithDuration:10
                     animations:^{
                         blockSelf.myLabel.frame = CGRectMake([blockSelf.view frame].size.width - 100,
                                                              [blockSelf.view frame].size.height - 50,
                                                              blockSelf.myLabel.frame.size.width,
                                                              blockSelf.myLabel.frame.size.height);
                     }];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
	animation.duration = 20.0;
	animation.repeatCount = 1.e10f;
	animation.autoreverses = YES;
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	animation.fromValue = (__bridge_transfer id)[self.myTestView newPath];
	animation.toValue = (__bridge_transfer id)[self.myTestView newMutatedPath];
	[self.myTestView.shapeLayer addAnimation:animation
                                      forKey:@"animatePath"];
}

#pragma mark -

- (void)callMe:(NSTimer *)sender
{
    self.myLabel.text = [NSString stringWithFormat:@"%ld",
                         (long)self.myCounter];

    NSLog(@"%s has been called by %@, counter = %ld",
          __FUNCTION__,
          [sender description],
          (long)self.myCounter);
    
    // At t=20.0s we stop tracking.
    if (self.myCounter++ == 200) {
        [sender invalidate];
    }
    
    // At t=3.0s we remove the label.
    if (self.myCounter == 30) {
        [self.myLabel removeFromSuperview];
    }
    
    // At t=5.0s we show the label again.
    if (self.myCounter == 50) {
        [self.view addSubview:self.myLabel];
    }
    
    // At t=7.5s we do another animation.
    if (self.myCounter == 75) {
        __weak WSViewController *blockSelf = self;
        [UIView animateWithDuration:10
                         animations:^{
                             blockSelf.myLabel.frame = CGRectMake((blockSelf.view.frame.size.width -
                                                                   blockSelf.myLabel.frame.size.width)/2,
                                                                  50,
                                                                  blockSelf.myLabel.frame.size.width,
                                                                  blockSelf.myLabel.frame.size.height);
                         }];
    }
}

@end
