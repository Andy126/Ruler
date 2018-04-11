//
//  PatientWeightVC.m
//  患者信息
//
//  Created by 柯航 on 16/2/16.
//  Copyright © 2016年 kehang. All rights reserved.
//

#import "PatientWeightVC.h"
#import "ScaleHelper.h"
#import "RulerTransverseScaleView.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define __kbaseColor ([UIColor colorWithRed:0.13f green:0.68f blue:0.89f alpha:1.00f])
#define __kgrayColor ([UIColor colorWithRed:0.53 green:0.53 blue:0.55 alpha:1.00f])
#define __kdeepgrayColor ([UIColor colorWithRed:0.39 green:0.39 blue:0.39 alpha:1.00f])
#define __klineColor ([UIColor colorWithRed:0.78 green:0.78 blue:0.8 alpha:1.00f])


@interface PatientWeightVC ()<UIScrollViewDelegate>
{
    UILabel *_showLab;
    NSInteger _weight;       //记录当前的体重
}

@end

@implementation PatientWeightVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = __kbaseColor;
    _weight = 35.5;
    
    [self uiconfig];
}


-(void)uiconfig
{
    
    /**
     *创建title
     */
    
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, ScalePx(192), SCREEN_WIDTH, ScalePx(80))];
    titleLab.text = @"患者的体重";
    titleLab.textColor = [UIColor whiteColor];
    if (SCREEN_WIDTH == 320) {
        titleLab.font = [UIFont systemFontOfSize:22];
        
    }
    titleLab.font = [UIFont systemFontOfSize:25];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLab];
    
    /**
     *创建显示体重的框
     */
    
    UIImageView *showImgView = [[UIImageView alloc]initWithFrame:CGRectMake(ScalePx(92), ScalePx(512), ScalePx(600), ScalePx(201))];
    showImgView.image = [UIImage imageNamed:@"patientheightView@3x.png"];
    [self.view addSubview:showImgView];
    _showLab = [[UILabel alloc]initWithFrame:CGRectMake(ScalePx(18), ScalePx(81), ScalePx(600), ScalePx(72))];
    _showLab.textColor = __kgrayColor;
    _showLab.font = [UIFont systemFontOfSize:ScalePx(72)];
    [self updateShowLab];
    [showImgView addSubview:_showLab];

    /**
     *创建小人
     */
    
    UIImageView *humanImg = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - ScalePx(565),ScalePx(564), ScalePx(304), ScalePx(712))];
    if (_sex == 0) {
        humanImg.image = [UIImage imageNamed:@"man"];
    }else
    {
        humanImg.image = [UIImage imageNamed:@"wowan"];
        
    }
    [self.view addSubview:humanImg];
    
    /**
     *创建标尺
     */
    UIImageView *scrollTitleView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - ScalePx(975), CGRectGetMaxY(humanImg.frame) + ScalePx(145), ScalePx(734), ScalePx(12))];
    scrollTitleView.image = [UIImage imageNamed:@"colorimage2@3x.png"];
    [self.view addSubview:scrollTitleView];
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - ScalePx(975), CGRectGetMaxY(scrollTitleView.frame), ScalePx(734), ScalePx(180))];
    scroll.backgroundColor = [UIColor whiteColor];
    scroll.contentSize = CGSizeMake(1444, 0);
    RulerTransverseScaleView *scaleView = [[RulerTransverseScaleView alloc]initWithFrame:CGRectMake(0, 0, 1444, ScalePx(180))];
    scroll.delegate = self;
    scroll.bounces = NO;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.contentOffset= CGPointMake(139, 0);
    [scaleView uiconfig];
    [scroll addSubview:scaleView];
    [self.view addSubview:scroll];
    
    UIImageView *biaochi = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(scroll.frame) + 100, CGRectGetMaxY(scroll.frame) - ScalePx(55), ScalePx(27), ScalePx(55))];
    biaochi.image = [UIImage imageNamed:@"scaleImage2@3x.png"];
    [self.view addSubview:biaochi];


    
    /**
     *创建底部按钮
     */
    
    
    for (int i = 0; i < 1; i ++) {
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


/**
 *更新显示的数据
 */
-(void)updateShowLab
{
    NSString * contentStr = [[NSString alloc]initWithFormat:@"患者的体重%ld.0kg",(long)_weight];
    NSInteger num = 3;
    if (contentStr.length == 12) {
        num = 5;
    }else if(contentStr.length == 11)
    {
        num = 4;
    }else
    {
        num = 3;
    }
    
    NSMutableAttributedString *showStr = [[NSMutableAttributedString alloc] initWithString:contentStr];
    [showStr addAttribute:NSForegroundColorAttributeName value:__kbaseColor range:NSMakeRange(5,num)];
    [showStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:NSMakeRange(0, 5)];
    _showLab.attributedText = showStr;
    
   
}

-(void)nextAction:(UIButton *)btn
{

    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - scrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //计算偏移了几个contentOffset为偏移的x的值
    NSInteger X = scrollView.contentOffset.x/4  ;
    _weight =  X ;
    [self updateShowLab];
    NSLog(@"%ldcontentOffset=%ld",(long)_weight,(long)X);
}
// scrollView 结束拖动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //计算偏移了几个contentOffset为偏移的x的值
    NSInteger X = (scrollView.contentOffset.x+1)/4  ;
    _weight =  X ;
    [self updateShowLab];
    
    NSLog(@"%ldcontentOffset=%ld",(long)_weight,(long)X);
}
//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
