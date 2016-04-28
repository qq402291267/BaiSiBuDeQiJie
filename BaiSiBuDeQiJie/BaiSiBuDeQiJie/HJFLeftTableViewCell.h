//
//  HJFLeftTableViewCell.h
//  BaiSiBuDeQiJie
//
//  Created by 胡江峰 on 16/4/20.
//  Copyright © 2016年 胡江峰. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HJFFoucsCategory;
@interface HJFLeftTableViewCell : UITableViewCell
@property (nonatomic ,strong) HJFFoucsCategory *leftTable;
+ (instancetype)cellInitWithTable:(UITableView*) tableView;
@end


