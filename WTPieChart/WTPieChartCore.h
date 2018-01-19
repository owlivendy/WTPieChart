//
//  WTPieChartCore.h
//  Wallet
//
//  Created by xiaofeishen on 5/6/16.
//  Copyright © 2016 xiaofeishen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTPieChartPiece.h"

@class WTPieChartCore;
@protocol WTPieChartCoreDelegate <NSObject>
- (void)wtPieChartCore:(WTPieChartCore *)core slideInIndex:(NSInteger)index;
@end
@interface WTPieChartCore : UIView

@property (nonatomic, strong) NSMutableArray<WTPieChartPiece *> *pieces;
@property (nonatomic, assign) CGFloat beignAngle;
@property (nonatomic, weak) id<WTPieChartCoreDelegate> delegate;

//获取扇形的颜色
- (UIColor *)arcColorWithIndex:(NSInteger)index;

@end
