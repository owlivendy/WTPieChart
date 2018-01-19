//
//  WTPireChartPiece.h
//  Wallet
//
//  Created by xiaofeishen on 5/4/16.
//  Copyright © 2016 xiaofeishen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTPieChartPiece : NSObject

@property (nonatomic, assign) float value;

@property (nonatomic, assign) float begin;
@property (nonatomic, assign) float delta;
@property (nonatomic, assign) WTPieChartPiece *pre;

@end
