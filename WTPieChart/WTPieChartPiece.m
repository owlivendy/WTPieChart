//
//  WTPireChartPiece.m
//  Wallet
//
//  Created by xiaofeishen on 5/4/16.
//  Copyright © 2016 xiaofeishen. All rights reserved.
//

#import "WTPieChartPiece.h"

@implementation WTPieChartPiece

- (float)begin
{
    if (self.pre == nil) {
        _begin = [self correctBeginValue:_begin];
        return _begin;
    } else {
        _begin = self.pre.begin + self.pre.delta;
        _begin = [self correctBeginValue:_begin];
        return  _begin;
    }
}

- (float)correctBeginValue:(float)begin
{
    if (begin > M_PI * 2) {
        begin -= M_PI * 2;
    } else if (begin < 0) {
        begin = M_PI * 2 + begin;
    }
    return begin;
}

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"<%@: %p, value: %f>",[self class],self,self.value];
}

@end
