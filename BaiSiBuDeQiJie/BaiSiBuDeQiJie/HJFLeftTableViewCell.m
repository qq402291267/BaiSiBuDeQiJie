//
//  HJFLeftTableViewCell.m
//  BaiSiBuDeQiJie
//
//  Created by 胡江峰 on 16/4/20.
//  Copyright © 2016年 胡江峰. All rights reserved.
//

#import "HJFLeftTableViewCell.h"
#import "HJFFoucsCategory.h"

@interface HJFLeftTableViewCell()
@property (weak, nonatomic) IBOutlet UIView *selectedView;

@end

@implementation HJFLeftTableViewCell

- (void)awakeFromNib {
    self.textLabel.textColor = [UIColor blackColor];
    self.textLabel.highlightedTextColor = [UIColor redColor];
    self.backgroundColor = [UIColor whiteColor];
    
}

-(void)setLeftTable:(HJFFoucsCategory *)leftTable{
    _leftTable = leftTable;
    self.textLabel.text =leftTable.name;
}



+ (instancetype)cellInitWithTable:(UITableView *)tableView
{
    static NSString *identifier = @"ok";
    
    //    1.先去缓存池中查找是否有满足条件的Cell
    HJFLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //    2.如果缓存池中没有符合条件的cell,就自己创建一个Cell
    if (cell == nil) {
        //    3.创建Cell, 并且设置一个唯一的标记
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HJFLeftTableViewCell" owner:nil options:nil] firstObject];
        
    }
    return cell;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.textLabel.height = self.textLabel.height-2;

    
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
    self.selectedView.hidden =!selected;
    self.textLabel.textColor = selected?[UIColor redColor]:[UIColor blackColor];

}


@end
