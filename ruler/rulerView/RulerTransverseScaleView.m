//
//  RulerTransverseScaleView.m
//  尺子
//
//  Created by 柯航 on 16/2/15.
//  Copyright © 2016年 kehang. All rights reserved.
//

#import "RulerTransverseScaleView.h"
#define lineColor [UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1]
#define Height  self.frame.size.height

@implementation RulerTransverseScaleView

-(void)uiconfig
{
    
    self.backgroundColor = [UIColor whiteColor];
    [self setNeedsDisplay];
    
    for (int i = 0; i <= 35; i ++) {
        UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(i  * 40 - 18 + 104, Height - 40, 36, 15)];
        NSString *numStr = [NSString stringWithFormat:@"%d", i *10 ];
        numLab.text = numStr;
        numLab.font = [UIFont systemFontOfSize:14];
        numLab.textAlignment = NSTextAlignmentCenter;
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
    
    
    for (int i = 0; i <= 350; i++) {
        int a = 0;
        if (i%5 == 0) {
            a = 4;
        }
        if (i%10 == 0) {
            a = 10;
        }
        CGPoint points[] = {CGPointMake( 104 + i * 4, Height - a - 10),
            CGPointMake( 104 + i * 4, Height),
     
        };
        //参数2:表示点的数组
        //参数3:表示数组中的点,有几个有效
        CGContextAddLines(ctx, points, 2);
        CGContextStrokePath(ctx);
    }
}



@end
