//
//  ViewController.m
//  WTChartDemo
//
//  Created by xiaofeishen on 5/12/16.
//  Copyright © 2016 xiaofeishen. All rights reserved.
//

#import "ViewController.h"
#import "WTPieChart.h"

@interface ViewController ()
<WTPieChartDelegate>
{
    WTPieChart *_chart;
    NSArray *_values;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //data
    _values = @[@(10),@(20),@(30),@(40),@(50),@(60),@(70),@(80),@(90)];
//    ,@(100),@(110),@(120),@(130),@(140),@(150)
    //views
    _chart = [[WTPieChart alloc] initWithFrame:CGRectZero];
    _chart.delegate = self;
    [_chart setValues:_values];
    _chart.backgroundColor = [UIColor whiteColor];
    _chart.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_chart];
    
    //layout
    NSDictionary *views = NSDictionaryOfVariableBindings(_chart);
    NSMutableArray *layouts = @[].mutableCopy;
    [layouts addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_chart]-|" options:0 metrics:nil views:views]];
    [layouts addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[_chart]" options:0 metrics:nil views:views]];
    [layouts addObject:[NSLayoutConstraint constraintWithItem:_chart attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_chart attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
    [self.view addConstraints:layouts];
}

- (void)wtPieChart:(WTPieChart *)chart pointAt:(NSInteger)index
{
    NSLog(@"\nindex: %ld, value: %@",(long)index,_values[index]);
}

@end
