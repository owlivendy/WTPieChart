//
//  WTPieChartCover.m
//  Wallet
//
//  Created by xiaofeishen on 5/10/16.
//  Copyright © 2016 JohnTsai. All rights reserved.
//

#import "WTPieChartCover.h"
#import "WTPieChartTriangle.h"

const float __thickness = 20;

@interface WTPieChartCover ()
{
    WTPieChartTriangle *_triangle;
}
@end
@implementation WTPieChartCover

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _triangle = [[WTPieChartTriangle alloc] initWithFrame:CGRectZero];
        _triangle.triangleBgColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        _triangle.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_triangle];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(_triangle);
        NSMutableArray *cons = @[].mutableCopy;
        [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_triangle(==60)]" options:0 metrics:nil views:views]];
        [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_triangle(==50)]-0-|" options:0 metrics:nil views:views]];
        [cons addObject:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_triangle attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        [self addConstraints:cons];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    CGFloat raduis = rect.size.width/2 - __thickness/2;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddArc(ctx, center.x, center.y, raduis, 0, M_PI * 2, 0);
    
    CGContextSetLineWidth(ctx, __thickness);
    [[[UIColor lightGrayColor] colorWithAlphaComponent:0.1] setStroke];
    CGContextDrawPath(ctx, kCGPathStroke);
}

@end
