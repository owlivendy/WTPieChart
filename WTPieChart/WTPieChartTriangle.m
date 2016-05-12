//
//  WTPieChartTriangle.m
//  Wallet
//
//  Created by xiaofeishen on 5/10/16.
//  Copyright © 2016 JohnTsai. All rights reserved.
//

#import "WTPieChartTriangle.h"

@implementation WTPieChartTriangle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGSize size = rect.size;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, size.width/2, 0);
    CGContextAddLineToPoint(ctx, size.width, size.height);
    CGContextAddLineToPoint(ctx, 0, size.height);
    CGContextAddLineToPoint(ctx, size.width/2, 0);
    
    [self.triangleBgColor setFill];
    CGContextDrawPath(ctx, kCGPathFill);
}

@end
