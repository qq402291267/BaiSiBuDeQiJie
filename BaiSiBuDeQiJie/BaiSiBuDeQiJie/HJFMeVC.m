//
//  HJFMeVC.m
//  BaiSiBuDeQiJie
//
//  Created by 胡江峰 on 16/4/14.
//  Copyright © 2016年 胡江峰. All rights reserved.
//

#import "HJFMeVC.h"
#import "UIBarButtonItem+CH.h"
@implementation HJFMeVC

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.navigationItem.title = @"我的";
    UIBarButtonItem *setBtn = [UIBarButtonItem itemWithLeftIcon:@"mine-setting-icon" highIcon:@"mine-setting-icon-click" target:self action:@selector(setBtnClick)];
    
    UIBarButtonItem *moonBtn = [UIBarButtonItem itemWithLeftIcon:@"mine-moon-icon" highIcon:@"mine-moon-icon-click" target:self action:@selector(moonBtnClick)];
    
    
    
    
    self.navigationItem.rightBarButtonItems = @[setBtn,moonBtn];
}

-(void)setBtnClick{
    HJFLog(@"胡江峰的设置被电击了");
}
-(void)moonBtnClick{
    HJFLog(@"胡江峰的夜晚模式被电击了");
}
@end
