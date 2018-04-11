//
//  RulerScaleView.m
//  尺子
//
//  Created by 柯航 on 16/2/5.
//  Copyright © 2016年 kehang. All rights reserved.
//

#import "RulerVerticalScaleView.h"
#define lineColor [UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1]

@implementation RulerVerticalScaleView



-(void)uiconfig
{
    
    self.backgroundColor = [UIColor whiteColor];
    [self setNeedsDisplay];
    
    for (int i = 0; i < 30; i ++) {
        UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(33, 9 +40 * i, 36, 13)];
        NSString *numStr = [NSString stringWithFormat:@"%d",300 - i *10];
        numLab.text = numStr;
        numLab.font = [UIFont systemFontOfSize:13];
        numLab.textColor = [UIColor colorWithRed:0.43 green:0.43 blue:0.43 alpha:1];
        [self addSubview:numLab];
    }
    
    
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(ctx, 1);
    //设置连接点的样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);

    //设置端点的样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    [lineColor setStroke];
    
    //定义一个包含多个点的数组
    
    for (int i = 0; i < 300; i++) {
        int a = 0;
        if (i%10 == 0) {
            a = 10;
        }
        CGPoint points[] = {CGPointMake(0, 16 + 4 * i),
            CGPointMake(17 + a, 16+ 4 * i),
        };
        //参数2:表示点的数组
        //参数3:表示数组中的点,有几个有效
        CGContextAddLines(ctx, points, 2);
        
        CGContextStrokePath(ctx);
    }
    
    
}


@end
