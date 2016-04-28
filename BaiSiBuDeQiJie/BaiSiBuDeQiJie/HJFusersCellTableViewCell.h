//
//  HJFusersCellTableViewCell.h
//  BaiSiBuDeQiJie
//
//  Created by 胡江峰 on 16/4/21.
//  Copyright © 2016年 胡江峰. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HJFusers;
@interface HJFusersCellTableViewCell : UITableViewCell
@property (nonatomic ,strong) HJFusers *user;
+ (instancetype)cellInitWithTable:(UITableView*) tableView;
@end
