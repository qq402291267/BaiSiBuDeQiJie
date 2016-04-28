//
//  HJFtabBarVC.m
//  BaiSiBuDeQiJie
//
//  Created by 胡江峰 on 16/4/14.
//  Copyright © 2016年 胡江峰. All rights reserved.
//

#import "HJFtabBarVC.h"
#import "HJFMeVC.h"
#import "HJFMessageVC.h"
#import "HJFNewVC.h"
#import "HJFFriendVC.h"
#import "HJFtabBar.h"
#import "HJFNavigationVC.h"
@interface HJFtabBarVC()<HJFTabbarDelegate>
@property (nonatomic ,weak) HJFtabBar *myTabBar;
@end

@implementation HJFtabBarVC

-(void)viewDidLoad{
    [super viewDidLoad];
    HJFtabBar *myTabBar = [[HJFtabBar alloc] init];
    myTabBar.frame = self.tabBar.frame;
    self.myTabBar = myTabBar;
    [self.view addSubview:myTabBar];
    self.tabBar.hidden = YES;
    myTabBar.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hidetabBar) name:hidetabBar_Notification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showtabBar) name:showtabBar_Notification object:nil];
    
    [myTabBar addTabBarWithimage:@"tabBar_essence_icon" SELimage:@"tabBar_essence_click_icon" title:@"精华"];
    [myTabBar addTabBarWithimage:@"tabBar_new_icon" SELimage:@"tabBar_new_click_icon" title:@"新帖"];
    
    [myTabBar addTabBarWithimage:@"tabBar_friendTrends_icon" SELimage:@"tabBar_friendTrends_click_icon" title:@"关注"];
    [myTabBar addTabBarWithimage:@"tabBar_me_icon" SELimage:@"tabBar_me_click_icon" title:@"我"];
    
    HJFMessageVC *messageVC = [[HJFMessageVC alloc] init];
    HJFNavigationVC *messageNav = [[HJFNavigationVC alloc] initWithRootViewController:messageVC];
    
    HJFNewVC *newVC = [[HJFNewVC alloc] init];
    HJFNavigationVC *newNav = [[HJFNavigationVC alloc] initWithRootViewController:newVC];
    
    HJFFriendVC *friendVC = [[HJFFriendVC alloc] init];
     HJFNavigationVC *friendNav = [[HJFNavigationVC alloc] initWithRootViewController:friendVC];
    
    HJFMeVC *meVC = [[HJFMeVC alloc] init];
     HJFNavigationVC *meNav = [[HJFNavigationVC alloc] initWithRootViewController:meVC];
    
    [self addChildViewController:messageNav];
    [self addChildViewController:newNav];
    [self addChildViewController:friendNav];
    [self addChildViewController:meNav];
}



-(void)tabbarDidClickBtnTag:(NSInteger)index{
        self.selectedIndex = index;


}

-(void)tabbarDidClickaddBtnTag:(NSInteger)index{
    HJFLog(@"添加按钮点击了");

}

-(void)hidetabBar{
    self.myTabBar.hidden =YES;
}

-(void)showtabBar{
    self.myTabBar.hidden = NO;
}

@end
