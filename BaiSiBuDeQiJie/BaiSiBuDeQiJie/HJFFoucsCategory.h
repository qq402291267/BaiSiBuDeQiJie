//
//  HJFFoucsCategory.h
//  BaiSiBuDeQiJie
//
//  Created by 胡江峰 on 16/4/20.
//  Copyright © 2016年 胡江峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJFFoucsCategory : NSObject
/** id */
@property (nonatomic, assign) NSInteger id;
/** 总数 */
@property (nonatomic, assign) NSInteger count;
/** 名字 */
@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSMutableArray *users;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger currentPage;
@end
