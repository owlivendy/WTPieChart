//
//  WTPieChart.h
//  Wallet
//
//  Created by xiaofeishen on 5/4/16.
//  Copyright © 2016 JohnTsai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WTPieChart;
@protocol WTPieChartDelegate <NSObject>
- (void)wtPieChart:(WTPieChart *)chart pointAt:(NSInteger)index;
@end

@interface WTPieChart : UIView

@property (nonatomic, weak) id<WTPieChartDelegate> delegate;

- (void)setValues:(NSArray<NSNumber *> *)values;

//获取扇形的颜色
- (UIColor *)arcColorWithIndex:(NSInteger)index;

@end
