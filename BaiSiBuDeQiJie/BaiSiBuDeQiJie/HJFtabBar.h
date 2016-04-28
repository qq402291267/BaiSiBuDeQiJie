//
//  HJTtabBarModel.h
//  BaiSiBuDeQiJie
//
//  Created by 胡江峰 on 16/4/15.
//  Copyright © 2016年 胡江峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HJFTabbarDelegate <NSObject>

@optional
-(void)tabbarDidClickBtnTag:(NSInteger)index;
-(void)tabbarDidClickaddBtnTag:(NSInteger)index;
@end

@interface HJFtabBar : UIView

-(void)addTabBarWithimage:(NSString*)imageName SELimage: (NSString*) SELimageName title:(NSString*)title;
@property (nonatomic, weak) id<HJFTabbarDelegate> delegate;
@end
