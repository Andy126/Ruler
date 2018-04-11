//
//  ScaleHelper.m
//  ScreenDemo
//
//  Created by zhaohuan on 15/7/30.
//  Copyright (c) 2015年 Webcity. All rights reserved.
//

#import "ScaleHelper.h"

#define RES_SIZE CGSizeMake(1240,2208)

@implementation ScaleHelper

static float scaleX = 0.0f;
static float scaleY = 0.0f;

+ (void)initScale
{
    
    CGSize winSize = [[UIScreen mainScreen] bounds].size;
    
    scaleX = 1.0f * winSize.width  / RES_SIZE.width;
    scaleY = 1.0f * winSize.height / RES_SIZE.height;
    
}


+ (float)minScale
{
    return scaleX > scaleY ? scaleY : scaleX;
}

+ (float)maxScale
{
    return scaleX > scaleY ? scaleX : scaleY;
}

+ (float)scaleX
{
    return scaleX;
}

+ (float)scaleY
{
    return scaleY;
}

+ (UIImage *)GMScale:(UIImage *)aImage
{
    aImage = [UIImage imageWithCGImage:aImage.CGImage scale:1.0f / [self minScale] orientation:aImage.imageOrientation];
    
    return aImage;
}

+ (UIImage *)Scale:(UIImage *)aImage
{
    CGSize size = CGSizeMake(aImage.size.width * scaleX, aImage.size.height * scaleY);
    
    UIGraphicsBeginImageContext(size); //size 为CGSize类型，即你所需要的图片尺寸
    [aImage drawInRect:CGRectMake(0, 0, size.width, size.height)]; //newImageRect指定了图片绘制区域
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)MaxScale:(UIImage *)aImage
{
    aImage = [UIImage imageWithCGImage:aImage.CGImage scale:1.0f / [self minScale] orientation:aImage.imageOrientation];
    
    return aImage;
}

+ (UIImage *)MaxScale1:(UIImage *)aImage
{
    float scale = [self minScale];
    
    CGSize size = CGSizeMake(aImage.size.width * scale, aImage.size.height * scale);
    
    UIGraphicsBeginImageContext(size); //size 为CGSize类型，即你所需要的图片尺寸
    [aImage drawInRect:CGRectMake(0, 0, size.width, size.height)]; //newImageRect指定了图片绘制区域
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (CGRect)ScaleRect:(CGRect)aRect
{
    return CGRectMake(aRect.origin.x * [ScaleHelper minScale], aRect.origin.y * [ScaleHelper minScale], aRect.size.width, aRect.size.height);
}



@end
