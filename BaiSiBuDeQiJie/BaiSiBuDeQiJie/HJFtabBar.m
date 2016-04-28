//
//  HJTtabBarModel.m
//  BaiSiBuDeQiJie
//
//  Created by 胡江峰 on 16/4/15.
//  Copyright © 2016年 胡江峰. All rights reserved.
//

#import "HJFtabBar.h"
#import "HJFtabBarBtn.h"
@interface HJFtabBar ()

@property (nonatomic ,weak) UIButton *addBtn;
@property (nonatomic ,weak) UIButton *selectedBtn;
@end

@implementation HJFtabBar


-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBA(246, 246, 246, 1);
        UIButton *addBtn = [[UIButton alloc] init];
        [addBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [addBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        addBtn.tag = 100;
        [addBtn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.addBtn = addBtn;
        [self addSubview:addBtn];
    }
    return self;
}

-(void)addTabBarWithimage:(NSString *)imageName SELimage:(NSString *)SELimageName title:(NSString *)title{
    UIButton *btn = [[HJFtabBarBtn alloc] init];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:SELimageName] forState:UIControlStateSelected];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    if (self.subviews.count ==2) {
        btn.selected = YES;
        _selectedBtn = btn;
    }

}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat btnW = self.width/self.subviews.count;
    CGFloat btnH = self.height;
    UIButton *btn = self.subviews[0];
    btn.width = btnW;
    btn.height = btnH;
    btn.y = 0;
    btn.centerX = self.centerX;
    

    for (int i = 1; i<self.subviews.count; i++) {
        UIButton *btn = self.subviews[i];
        btn.tag = i-1;
        btn.width = btnW;
        btn.height = btnH;
        btn.y = 0;      
        if (i<3) {
             btn.x = (i-1)*btnW;
        }
        else{
            btn.x = i*btnW;
        }

        
    }
    

}

-(void)btnClick:(UIButton *)btn{
    
    _selectedBtn.selected = NO;
    btn.selected = YES;
    _selectedBtn = btn;
    
    if ([self.delegate respondsToSelector:@selector(tabbarDidClickBtnTag:)]) {
        [self.delegate tabbarDidClickBtnTag:btn.tag];
    }

}
-(void)addBtnClick:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(tabbarDidClickaddBtnTag:)]) {
        [self.delegate tabbarDidClickaddBtnTag:btn.tag];
    }

}

@end
