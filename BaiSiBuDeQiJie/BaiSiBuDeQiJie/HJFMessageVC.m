//
//  HJFmessageVC.m
//  BaiSiBuDeQiJie
//
//  Created by 胡江峰 on 16/4/14.
//  Copyright © 2016年 胡江峰. All rights reserved.
//

#import "HJFMessageVC.h"
#import "UIBarButtonItem+CH.h"
#import "testVC.h"
@implementation HJFMessageVC

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(223, 223, 223, 1);

    self.navigationItem.titleView =[[UIImageView alloc] initWithImage:
    [UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithLeftIcon:@"MainTagSubIcon" highIcon:@"MainTagSubIconClick" target:self action:@selector(leftBarButtonItemClick)];
}

-(void)leftBarButtonItemClick{
    HJFLog(@"胡江峰message的左键被电击了");
}
@end
