//
//  StringWidth.m
//  网易彩票
//
//  Created by 胡江峰 on 15/10/20.
//  Copyright © 2015年 胡江峰. All rights reserved.
//

#import "StringWidth.h"

@implementation StringWidth

+(CGFloat)titleWeighWithTitle:(NSString *)title size:(CGFloat)size

{
    NSDictionary *dict = @{
                           NSFontAttributeName: [UIFont systemFontOfSize:size]
                           
                           };
    
    return [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil].size.width;

}

+ (CGSize) titleSizeWithTitle:(NSString *)title size:(CGFloat)size;

{
    return [self titleSizeWithTitle:title size:size MaxW:MAXFLOAT];
    
}

+ (CGSize) titleSizeWithTitle:(NSString *)title size:(CGFloat)size MaxW:(CGFloat)MaxW

{
    NSDictionary *dict = @{
                           NSFontAttributeName: [UIFont systemFontOfSize:size]
                           
                           };
    CGSize maxSize = CGSizeMake(MaxW, MAXFLOAT);
    
    return [title boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    
}
@end
