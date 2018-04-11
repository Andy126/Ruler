//
//  ScaleHelper.h
//  ScreenDemo
//
//  Created by zhaohuan on 15/7/30.
//  Copyright (c) 2015年 Webcity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//#define ScaleCGRectMake(x,y,w,h) CGRectMake(x * [ScaleHelper minScale], y * [ScaleHelper minScale], w * [ScaleHelper minScale], h * [ScaleHelper minScale])
#define ScaleCGRectMake(x,y,w,h) CGRectMake((x) * [ScaleHelper scaleX], (y) * [ScaleHelper scaleY], (w) * [ScaleHelper minScale], (h) * [ScaleHelper minScale])

//#define Scale(rect) CGRectMake(rect.origin.x * [ScaleHelper minScale], rect.origin.y * [ScaleHelper minScale], rect.size.width * [ScaleHelper minScale], rect.size.height * [ScaleHelper minScale])

#define Scale(rect) CGRectMake(rect.origin.x * [ScaleHelper scaleX], rect.origin.y * [ScaleHelper scaleY], rect.size.width * [ScaleHelper minScale], rect.size.height * [ScaleHelper minScale])


//#define ScalePx(px) (px * [ScaleHelper minScale])
//#define ScaleCGPoint(x, y) CGPointMake(x * [ScaleHelper minScale], y * [ScaleHelper minScale])

#define ScalePx(px) ((px) * [ScaleHelper minScale])
#define ScaleX(px) ((px) * [ScaleHelper scaleX])
#define ScaleY(px) ((px) * [ScaleHelper scaleY])
#define ScaleCGPoint(x, y) CGPointMake((x) * [ScaleHelper scaleX], (y) * [ScaleHelper scaleY])


#define ScaleCGSizeMake(w, h) CGSizeMake((w) * [ScaleHelper minScale], (h) * [ScaleHelper minScale])

@interface ScaleHelper : NSObject

+ (void)initScale;

+ (float)minScale;
+ (float)maxScale;

+ (float)scaleX;
+ (float)scaleY;

+ (UIImage *)GMScale:(UIImage *)aImage;

+ (UIImage *)Scale:(UIImage *)aImage;
+ (UIImage *)MaxScale:(UIImage *)aImage;

+ (CGRect)ScaleRect:(CGRect)aRect;

@end
