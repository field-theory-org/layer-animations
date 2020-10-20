//
//  WSTestView.m
//  ca-test
//
//  Created by Wolfram Schroers on 12/1/11.
//  Copyright (c) 2011 Numerik & Analyse Schroers. All rights reserved.
//

#import "WSTestView.h"

@implementation WSTestView

@synthesize shapeLayer = _shapeLayer;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CALayer *layer = [self layer];
        self.backgroundColor = [UIColor clearColor];
        self.shapeLayer = [CAShapeLayer layer];
        self.shapeLayer.backgroundColor = [[UIColor brownColor] CGColor];
        self.shapeLayer.lineWidth = 2;
        self.shapeLayer.strokeColor = [[UIColor redColor] CGColor];
        self.shapeLayer.fillColor = [[UIColor greenColor] CGColor];
        self.shapeLayer.shadowRadius = 10;
        self.shapeLayer.shadowColor = [[UIColor blackColor] CGColor];
        self.shapeLayer.shadowOffset = CGSizeMake(3, 7);
        self.shapeLayer.shadowOpacity = 0.5;
        [layer addSublayer:self.shapeLayer];
        
        CGMutablePathRef myPath = [self newPath];
        self.shapeLayer.path = myPath;
        CFRelease(myPath);
    }
    return self;
}

#pragma mark -

- (CGMutablePathRef)newPath
{
    CGMutablePathRef aPath = CGPathCreateMutable();
    CGPathMoveToPoint(aPath, NULL, 50, 150);
    CGPathAddLineToPoint(aPath, NULL, 150, 200);
    CGPathAddLineToPoint(aPath, NULL, 50, 250);
    CGPathCloseSubpath(aPath);

    return aPath;
}

- (CGMutablePathRef)newMutatedPath
{
    CGMutablePathRef aPath = CGPathCreateMutable();
    CGPathMoveToPoint(aPath, NULL, 150, 170);
    CGPathAddLineToPoint(aPath, NULL, 300, 210);
    CGPathAddLineToPoint(aPath, NULL, 250, 50);
    CGPathCloseSubpath(aPath);
    
    return aPath;
}

@end
