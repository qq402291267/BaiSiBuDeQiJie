//
//  HJFNewVC.m
//  BaiSiBuDeQiJie
//
//  Created by 胡江峰 on 16/4/14.
//  Copyright © 2016年 胡江峰. All rights reserved.
//

#import "HJFNewVC.h"
#import "UIBarButtonItem+CH.h"
@implementation HJFNewVC
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    self.navigationItem.titleView =[[UIImageView alloc] initWithImage:
                                    [UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithLeftIcon:@"MainTagSubIcon" highIcon:@"MainTagSubIconClick" target:self action:@selector(leftBarButtonItemClick)];
}

-(void)leftBarButtonItemClick{
    HJFLog(@"胡江峰的NEW左键被电击了");
}
@end
