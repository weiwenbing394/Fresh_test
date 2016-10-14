//
//  MJDIYHeader.m
//  MJRefresh_Test
//
//  Created by 大家保 on 2016/10/14.
//  Copyright © 2016年 大家保. All rights reserved.
//

#import "MJDIYHeader.h"

@interface MJDIYHeader ()

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UILabel *subTitleLabel;

@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation MJDIYHeader

#pragma mark 重写方法

#pragma mark 初始化配置

- (void)prepare{
    [super prepare];
    //设置控件的高度
    self.mj_h=50;
    
    //添加label
    UILabel *label=[[UILabel alloc]init];
    label.textColor=[UIColor blueColor];
    label.font=[UIFont systemFontOfSize:15];
    label.textAlignment=NSTextAlignmentLeft;
    [self addSubview:label];
    self.titleLabel=label;
    
    
    UILabel *label2=[[UILabel alloc]init];
    label2.textColor=[UIColor greenColor];
    label2.font=[UIFont systemFontOfSize:15];
    label2.textAlignment=NSTextAlignmentLeft;
    [self addSubview:label2];
    self.subTitleLabel=label2;
    
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dropdown_anim__0001"]];
    logo.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:logo];
    self.imageView= logo;
}

#pragma mark 子控件的位置和尺寸
- (void)placeSubviews{
    [super placeSubviews];
    self.titleLabel.frame=CGRectMake(self.mj_w/2.0, 10, [[UIScreen mainScreen] bounds].size.width/2.0, 20);
    self.subTitleLabel.frame=CGRectMake(self.mj_w/2.0, 30, [[UIScreen mainScreen] bounds].size.width/2.0, 20);
    self.imageView.frame=CGRectMake(self.mj_w/2.0-90, 0, 80, 50);
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            self.titleLabel.text = @"赶紧下拉...";
            self.subTitleLabel.text=@"我是大酱油的";
            break;
        case MJRefreshStatePulling:
            self.titleLabel.text = @"赶紧放开我...";
            self.subTitleLabel.text=@"我是大酱油的";
            break;
        case MJRefreshStateRefreshing:
            self.titleLabel.text = @"我正在拼命加载...";
            self.subTitleLabel.text=@"我是大酱油的";
            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    
    // 1.0 0.5 0.0
    // 0.5 0.0 0.5
    CGFloat red = 1.0 - pullingPercent * 0.5;
    CGFloat green = 0.5 - 0.5 * pullingPercent;
    CGFloat blue = 0.5 * pullingPercent;
    self.titleLabel.textColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}


@end
