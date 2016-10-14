//
//  ViewController.m
//  MJRefresh_Test
//
//  Created by 大家保 on 2016/10/14.
//  Copyright © 2016年 大家保. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"
#import "MJChiBaoZiHeader.h"
#import "MJDIYHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self example05];
}

//普通状态
- (void)example01
{
    __weak __typeof(self) weakSelf = self;
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf shuaxin];
    }];
}

//隐藏时间
- (void)example02{
    __weak __typeof(self) weakSelf = self;
    //设置回掉
    MJRefreshNormalHeader *header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf shuaxin];
    }];
    //设置自动切换透明度
    header.automaticallyChangeAlpha=YES;
    //隐藏时间
    header.lastUpdatedTimeLabel.hidden=YES;
    //隐藏状态
    header.stateLabel.hidden=NO;
    self.myTableView.mj_header=header;
}

//自定义文字
- (void)example03{
    __weak __typeof(self) weakSelf = self;
    MJRefreshNormalHeader *header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf shuaxin];
    }];
    //设置文字
    [header setTitle:@"下拉前..." forState:MJRefreshStateIdle];
    [header setTitle:@"准备刷新..." forState:MJRefreshStatePulling];
    [header setTitle:@"正在刷新..." forState:MJRefreshStateRefreshing];
    
    //设置字体
    [header.stateLabel setFont:[UIFont boldSystemFontOfSize:13]];
    [header.lastUpdatedTimeLabel setFont:[UIFont boldSystemFontOfSize:13]];
    
    //设置颜色
    [header.stateLabel setTextColor:[UIColor redColor]];
    [header.lastUpdatedTimeLabel setTextColor:[UIColor redColor]];
    
    self.myTableView.mj_header=header;
}

//动画图片
- (void)example04{
    __weak __typeof(self) weakSelf = self;
    MJChiBaoZiHeader *header=[MJChiBaoZiHeader headerWithRefreshingBlock:^{
        [weakSelf shuaxin];
    }];
    //隐藏状态
    [header.stateLabel setHidden:YES];
    //隐藏刷新时间
    [header.lastUpdatedTimeLabel setHidden:YES];
    self.myTableView.mj_header=header;
}

//自定义
- (void)example05{
    __weak __typeof(self) weakSelf = self;
    self.myTableView.mj_header=[MJDIYHeader headerWithRefreshingBlock:^{
        [weakSelf shuaxin];
    }];
}

- (void)shuaxin{
    __weak typeof(self) weakSelf=self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.myTableView.mj_header endRefreshing];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
