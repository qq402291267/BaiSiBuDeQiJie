//
//  StringWidth.h
//  网易彩票
//
//  Created by 胡江峰 on 15/10/20.
//  Copyright © 2015年 胡江峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StringWidth : UIView
+ (CGFloat) titleWeighWithTitle:(NSString *)title size:(CGFloat)size;
+ (CGSize) titleSizeWithTitle:(NSString *)title size:(CGFloat)size;
+ (CGSize) titleSizeWithTitle:(NSString *)title size:(CGFloat)size MaxW:(CGFloat)MaxW;
@end
