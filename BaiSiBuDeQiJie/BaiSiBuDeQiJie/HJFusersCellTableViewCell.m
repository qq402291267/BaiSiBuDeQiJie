//
//  HJFusersCellTableViewCell.m
//  BaiSiBuDeQiJie
//
//  Created by 胡江峰 on 16/4/21.
//  Copyright © 2016年 胡江峰. All rights reserved.
//

#import "HJFusersCellTableViewCell.h"
#import "HJFusers.h"
#import "UIImageView+WebCache.h"
@interface HJFusersCellTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;

@end


@implementation HJFusersCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellInitWithTable:(UITableView *)tableView
{
    static NSString *identifier = @"usersCell";
    
    //    1.先去缓存池中查找是否有满足条件的Cell
   HJFusersCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //    2.如果缓存池中没有符合条件的cell,就自己创建一个Cell
    if (cell == nil) {
        //    3.创建Cell, 并且设置一个唯一的标记
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HJFusersCellTableViewCell" owner:nil options:nil] firstObject];
        
    }
    return cell;
}







-(void)setUser:(HJFusers *)user{
    _user = user;
    self.nameLabel.text = user.screen_name;
    self.fansCountLabel.text = user.fans_count;
    [self.headerView sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    

}










@end
