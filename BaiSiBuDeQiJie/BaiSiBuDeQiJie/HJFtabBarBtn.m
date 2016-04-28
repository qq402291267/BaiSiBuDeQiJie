//
//  HJFtabBarBtn.m
//  BaiSiBuDeQiJie
//
//  Created by 胡江峰 on 16/4/15.
//  Copyright © 2016年 胡江峰. All rights reserved.
//

#import "HJFtabBarBtn.h"
#import "StringWidth.h"
@implementation HJFtabBarBtn
-(instancetype)initWithFrame:(CGRect)frame{
    self= [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted{

}

-(CGRect) imageRectForContentRect:(CGRect)contentRect{
//    CGFloat W = 37;
//    CGFloat H =37;
//    CGFloat X = 6.5;
//    CGFloat Y =0;
//    return CGRectMake(0, 0, 37, 37);
    return CGRectMake((contentRect.size.width-37)/2, 0, 37, 37);
}


- (CGRect) titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleW = [StringWidth titleWeighWithTitle:@"随意" size:10];
    return CGRectMake((contentRect.size.width-titleW)/2, 32, titleW, 18);
     return CGRectMake(0, 32, titleW, 18);

}




@end
