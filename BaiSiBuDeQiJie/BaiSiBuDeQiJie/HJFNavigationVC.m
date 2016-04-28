//
//  HJFNavigationVC.m
//  BaiSiBuDeQiJie
//
//  Created by 胡江峰 on 16/4/15.
//  Copyright © 2016年 胡江峰. All rights reserved.
//

#import "HJFNavigationVC.h"
#import "UIImage+CH.h"
@interface HJFNavigationVC ()

@end

@implementation HJFNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

// 第一次使用这个类或者这个类的子类的时候
+ (void)initialize
{
    if (self == [HJFNavigationVC class]) { // 肯定能保证只调用一次
        [self setupNav];

    }
}

+ (void)setupNav
{

    UINavigationBar *bar = [UINavigationBar appearance];

    [bar setBackgroundImage:[UIImage imageWithColor:RGBA(247, 247, 247, 1)] forBarMetrics:UIBarMetricsDefault];
    
    
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName : [UIColor blackColor],
                           NSFontAttributeName : [UIFont systemFontOfSize:15]
                           };
    [bar setTitleTextAttributes:dict];
    
    // 设置导航条的主题颜色
//    [bar setTintColor:[UIColor greenColor]];//返回按钮的颜色
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count>0) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [btn setTitle:@"返回" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        btn.x = 0;
        btn.y = 0;
        btn.width = 50;
        btn.height = 50;
        [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//水平居左
        [btn sizeToFit];//自适应尺寸
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [[NSNotificationCenter defaultCenter] postNotificationName:hidetabBar_Notification object:nil];
    }
    
    
    [super pushViewController:viewController animated:animated];



}

-(void)back{
    [self popViewControllerAnimated:YES];
    if (self.childViewControllers.count ==1) {
        [[NSNotificationCenter defaultCenter] postNotificationName:showtabBar_Notification object:nil];
    }

}


@end
