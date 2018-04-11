//
//  PatientHeightVC.m
//  患者信息
//
//  Created by 柯航 on 16/2/15.
//  Copyright © 2016年 kehang. All rights reserved.
//

#import "PatientHeightVC.h"
#import "ScaleHelper.h"
#import "RulerVerticalScaleView.h"
#import "PatientWeightVC.h"

//宏定义可放置在全局中
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define __kbaseColor ([UIColor colorWithRed:0.13f green:0.68f blue:0.89f alpha:1.00f])
#define __kgrayColor ([UIColor colorWithRed:0.53 green:0.53 blue:0.55 alpha:1.00f])
#define __kdeepgrayColor ([UIColor colorWithRed:0.39 green:0.39 blue:0.39 alpha:1.00f])
#define __klineColor ([UIColor colorWithRed:0.78 green:0.78 blue:0.8 alpha:1.00f])


@interface PatientHeightVC ()<UIScrollViewDelegate>
{
    UILabel *_showLab;
    NSInteger _height;       //记录当前的身高
}

@end

@implementation PatientHeightVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = __kbaseColor;
    _height = 170;
    
    [self uiconfig];


}




-(void)uiconfig
{
    [ScaleHelper initScale];
    
    /**
     *创建title
     */
    
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, ScalePx(192), SCREEN_WIDTH, ScalePx(80))];
    titleLab.text = @"患者的身高";
    titleLab.textColor = [UIColor whiteColor];
    if (SCREEN_WIDTH == 320) {
        titleLab.font = [UIFont systemFontOfSize:22];

    }
    titleLab.font = [UIFont systemFontOfSize:25];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLab];

    /**
     *创建显示身高的框
     */
    
    UIImageView *showImgView = [[UIImageView alloc]initWithFrame:CGRectMake(ScalePx(174), ScalePx(405), ScalePx(554), ScalePx(219))];
    showImgView.image = [UIImage imageNamed:@"patientheightView@3x.png"];
    [self.view addSubview:showImgView];
    _showLab = [[UILabel alloc]initWithFrame:CGRectMake(ScalePx(18), ScalePx(81), ScalePx(600), ScalePx(72))];
    _showLab.textColor = __kgrayColor;
    _showLab.font = [UIFont systemFontOfSize:ScalePx(72)];
    [self updateShowLab];
    [showImgView addSubview:_showLab];
    
    /**
     *创建身高尺
     */
    UIImageView *scrollTitleView = [[UIImageView alloc]initWithFrame:CGRectMake(ScalePx(228), ScalePx(713), ScalePx(260), ScalePx(47))];
    scrollTitleView.image = [UIImage imageNamed:@"colorView1@3x.png"];
    [self.view addSubview:scrollTitleView];
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(ScalePx(228), ScalePx(760), ScalePx(260), ScalePx(826))];
    scroll.backgroundColor = [UIColor whiteColor];
    scroll.contentSize = CGSizeMake(0, 1300);
    RulerVerticalScaleView *scaleView = [[RulerVerticalScaleView alloc]initWithFrame:CGRectMake(0, 0, 300, 1216)];
    scroll.delegate = self;
    scroll.bounces = NO;
    scroll.showsVerticalScrollIndicator = NO;
    scroll.contentOffset= CGPointMake(0, 476);
    [scaleView uiconfig];
    [scroll addSubview:scaleView];
    [self.view addSubview:scroll];
    
    UIImageView *biaochi = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(scroll.frame), CGRectGetMinY(scroll.frame) + 56, ScalePx(55), ScalePx(27))];
    biaochi.image = [UIImage imageNamed:@"scaleImage1@3x.png"];
    [self.view addSubview:biaochi];
    
    /**
     *创建小人
     */

    UIImageView *humanImg = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - ScalePx(587), CGRectGetMaxY(scroll.frame) - ScalePx(712), ScalePx(304), ScalePx(712))];
    if (_sex == 0) {
        humanImg.image = [UIImage imageNamed:@"man"];
    }else
    {
        humanImg.image = [UIImage imageNamed:@"wowan@3x.png"];

    }
    [self.view addSubview:humanImg];
    
    /**
     *创建底部按钮
     */
    
    
    for (int i = 0; i < 2; i ++) {
        UIButton *nextBtn = [[UIButton alloc]init];
        nextBtn.backgroundColor = [UIColor colorWithRed:0.35f green:0.76f blue:0.93f alpha:1.00f];
        nextBtn.layer.cornerRadius = 5;
        [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        nextBtn.tag = 100+i;
        [nextBtn addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            [nextBtn setTitle:@"上一步" forState:UIControlStateNormal];
            nextBtn.frame = CGRectMake(ScalePx(175), SCREEN_HEIGHT - ScalePx(296), ScalePx(306), ScalePx(113));
        }else
        {
            [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
            nextBtn.frame = CGRectMake(SCREEN_WIDTH - ScalePx(481), SCREEN_HEIGHT - ScalePx(296),  ScalePx(306), ScalePx(113));
        }
        [self.view addSubview:nextBtn];
    }
  

}


-(void)nextAction:(UIButton *)btn
{
    if (btn.tag == 100) {
        [self.navigationController popViewControllerAnimated:YES];
    }else
    {
        if (_height == 0) {
            return;
        }
        PatientWeightVC *vc = [[PatientWeightVC alloc]init];
        vc.height = _height;
        vc.sex = _sex;
        [self presentViewController:vc animated:YES completion:nil];

    }
}

/**
 *更新显示的数据
 */
-(void)updateShowLab
{
    NSString * contentStr = [[NSString alloc]initWithFormat:@"患者的身高%ldcm",(long)_height];
    NSInteger num = 3;
    if (contentStr.length == 10) {
        num = 3;
    }else if(contentStr.length == 9)
    {
        num = 2;
    }else
    {
        num = 1;
    }
    
    NSMutableAttributedString *showStr = [[NSMutableAttributedString alloc] initWithString:contentStr];
    [showStr addAttribute:NSForegroundColorAttributeName value:__kbaseColor range:NSMakeRange(5,num)];
    [showStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:NSMakeRange(0, 5)];
    _showLab.attributedText = showStr;
}



-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //计算偏移了几个contentOffset为偏移的x的值
    NSInteger Y = scrollView.contentOffset.y /4 ;
    _height = 289 - Y ;
    [self updateShowLab];
    NSLog(@"%ldcontentOffset=%ld",(long)_height,(long)Y);
}
// scrollView 结束拖动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //计算偏移了几个contentOffset为偏移的x的值
    NSInteger Y = scrollView.contentOffset.y /4 ;
    _height = 289 - Y ;
    [self updateShowLab];

    NSLog(@"%ldcontentOffset=%ld",(long)_height,(long)Y);
}





@end
