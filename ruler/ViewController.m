//
//  ViewController.m
//  ruler
//
//  Created by andy on 2018/4/11.
//  Copyright © 2018年 andy. All rights reserved.
//

#import "ViewController.h"
#import "RulerTransverseScaleView.h"
#import "ScaleHelper.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    /**
//     *创建标尺
//     */
//    UIImageView *scrollTitleView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - ScalePx(975), 200+ ScalePx(145), ScalePx(734), ScalePx(12))];
//    scrollTitleView.image = [UIImage imageNamed:@"colorimage2@3x.png"];
//    [self.view addSubview:scrollTitleView];
//    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - ScalePx(975), CGRectGetMaxY(scrollTitleView.frame), ScalePx(734), ScalePx(180))];
//    scroll.backgroundColor = [UIColor whiteColor];
//    scroll.contentSize = CGSizeMake(1444, 0);
//    RulerTransverseScaleView *scaleView = [[RulerTransverseScaleView alloc]initWithFrame:CGRectMake(0, 0, 1444, ScalePx(180))];
//    scroll.delegate = self;
//    scroll.bounces = NO;
//    scroll.showsHorizontalScrollIndicator = NO;
//    scroll.contentOffset= CGPointMake(139, 0);
//    [scaleView uiconfig];
//    [scroll addSubview:scaleView];
//    [self.view addSubview:scroll];
//
//    UIImageView *biaochi = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(scroll.frame) + 100, CGRectGetMaxY(scroll.frame) - ScalePx(55), ScalePx(27), ScalePx(55))];
//    biaochi.image = [UIImage imageNamed:@"scaleImage2@3x.png"];
//    [self.view addSubview:biaochi];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    //计算偏移了几个contentOffset为偏移的x的值
//    NSInteger X = scrollView.contentOffset.x/4  ;
//    _weight =  X ;
//    [self updateShowLab];
//    NSLog(@"%ldcontentOffset=%ld",(long)_weight,(long)X);
//}

@end
