//
//  WTPieChart.m
//  Wallet
//
//  Created by xiaofeishen on 5/4/16.
//  Copyright © 2016 JohnTsai. All rights reserved.
//

#import "WTPieChart.h"
#import "WTPieChartCore.h"
#import "WTPieChartPiece.h"
#import "WTPieChartCover.h"

const float __beginAngle = M_PI_2; //M_PI为一个半圆，0表示在3点钟位置

@interface WTPieChart ()
<WTPieChartCoreDelegate>
{
    WTPieChartCover *_cover;
    CGFloat _total;
    WTPieChartCore *_coreVew;
    
    UILabel *_totalLb;
}
@end

@implementation WTPieChart

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        //views
        _coreVew = [[WTPieChartCore alloc] initWithFrame:CGRectZero];
        _coreVew.beignAngle = __beginAngle;
        _coreVew.delegate = self;
        _coreVew.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_coreVew];

        _cover = [[WTPieChartCover alloc] initWithFrame:CGRectZero];
        _cover.translatesAutoresizingMaskIntoConstraints = NO;
        _cover.userInteractionEnabled = NO;
        [self addSubview:_cover];
        
        _totalLb = [[UILabel alloc] initWithFrame:CGRectZero];
        _totalLb.font = [UIFont boldSystemFontOfSize:16.f];
        _totalLb.textColor = [UIColor whiteColor];
        _totalLb.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        _totalLb.userInteractionEnabled = NO;
        _totalLb.translatesAutoresizingMaskIntoConstraints = NO;
        _totalLb.clipsToBounds = YES;
        _totalLb.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_totalLb];
        
        //layout
        NSMutableArray *cons = @[].mutableCopy;
        NSDictionary *views = NSDictionaryOfVariableBindings(_coreVew,_cover,_totalLb);
        //circle
        [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_coreVew]-10-|" options:0 metrics:nil views:views]];
        [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_coreVew]-10-|" options:0 metrics:nil views:views]];
        //cover
        [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_cover]-0-|" options:0 metrics:nil views:views]];
        [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_cover]-0-|" options:0 metrics:nil views:views]];
        //_totalLb
        [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_totalLb(==100)]" options:0 metrics:nil views:views]];
        [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_totalLb(==100)]" options:0 metrics:nil views:views]];
        [cons addObject:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_totalLb attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        [cons addObject:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_totalLb attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
        
        [self addConstraints:cons];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _totalLb.layer.cornerRadius = CGRectGetWidth(_totalLb.frame)/2;
}

#pragma mark - setter & getter
- (void)setValues:(NSArray<NSNumber *> *)values
{
    if (values.count <= 0) {
        _total = 0;
        return;
    }
    
    NSMutableArray *pieces = [NSMutableArray array];
    _total = 0;
    for (NSNumber *value in values) {
        _total += [value floatValue];
        
        WTPieChartPiece *obj = [[WTPieChartPiece alloc] init];
        obj.value = [value floatValue];
        [pieces addObject:obj];
    };
    _totalLb.text = [NSString stringWithFormat:@"%.2f",_total];
    
    WTPieChartPiece *pre;
    for (int i = 0; i < pieces.count; i++) {
        WTPieChartPiece *obj = pieces[i];
        if (i == 0) {
            obj.begin = 0; //设置第一个起点值为0刻度
        } else {
            obj.pre = pre;
        }
        obj.delta = [values[i] floatValue]/_total * 2 * M_PI;
        pre = obj;
    }
    _coreVew.pieces = pieces;
}

//获取扇形的颜色
- (UIColor *)arcColorWithIndex:(NSInteger)index
{
    return [_coreVew arcColorWithIndex:index];
}

#pragma mark - delegate
- (void)wtPieChartCore:(WTPieChartCore *)core slideInIndex:(NSInteger)index
{
    [self.delegate wtPieChart:self pointAt:index];
}

@end
