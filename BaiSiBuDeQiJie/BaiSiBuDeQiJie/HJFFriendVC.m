//
//  HJFFriendVC.m
//  BaiSiBuDeQiJie
//
//  Created by 胡江峰 on 16/4/14.
//  Copyright © 2016年 胡江峰. All rights reserved.
//

#import "HJFFriendVC.h"
#import "UIBarButtonItem+CH.h"
#import "HJFFocusVC.h"
@implementation HJFFriendVC
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    self.navigationItem.title = @"我的关注";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithLeftIcon:@"friendsRecommentIcon" highIcon:@"friendsRecommentIcon-click" target:self action:@selector(leftBarButtonItemClick)];
}

-(void)leftBarButtonItemClick{
    HJFFocusVC *VC = [[HJFFocusVC alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
    HJFLog(@"胡江峰的关注左键被电击了");
}
@end
