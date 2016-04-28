//
//  HJFFoucsCategory.m
//  BaiSiBuDeQiJie
//
//  Created by 胡江峰 on 16/4/20.
//  Copyright © 2016年 胡江峰. All rights reserved.
//

#import "HJFFoucsCategory.h"

@implementation HJFFoucsCategory
-(NSMutableArray *)users
{
    if (!_users) {
        _users= [NSMutableArray array];
    }
    return _users;
}
@end
