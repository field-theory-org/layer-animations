//
//  WSTestView.h
//  ca-test
//
//  Created by Wolfram Schroers on 12/1/11.
//  Copyright (c) 2011 Numerik & Analyse Schroers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface WSTestView : UIView

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

- (CGMutablePathRef)newPath;
- (CGMutablePathRef)newMutatedPath;

@end
