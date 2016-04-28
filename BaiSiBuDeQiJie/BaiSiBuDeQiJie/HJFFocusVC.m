//
//  HJFFocusVC.m
//  BaiSiBuDeQiJie
//
//  Created by 胡江峰 on 16/4/19.
//  Copyright © 2016年 胡江峰. All rights reserved.
//

#import "HJFFocusVC.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "HJFFoucsCategory.h"
#import "HJFLeftTableViewCell.h"
#import "HJFusers.h"
#import "HJFusersCellTableViewCell.h"
#import "MJRefresh.h"

#define HJFSelectedCategory self.categories[self.categoriesTableView.indexPathForSelectedRow.row]
@interface HJFFocusVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *categoriesTableView;
@property (weak, nonatomic) IBOutlet UITableView *usersTableView;
@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, strong) NSMutableDictionary  *params;
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation HJFFocusVC

-(AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//初始化并加载左侧界面
    
    [self setLeftTableview];
    [self setupRefresh];
}

//左侧界面
-(void)setLeftTableview{
    self.usersTableView.rowHeight = 70;
    self.navigationItem.title = @"推荐关注";
    self.view.backgroundColor = RGBA(224, 224, 224, 1);
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [SVProgressHUD showWithStatus:@"加载中"];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [[AFHTTPSessionManager manager] GET:@"https://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        //成功
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        self.categories = [HJFFoucsCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.categoriesTableView reloadData];
        [self.categoriesTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        [self.usersTableView.mj_header beginRefreshing];
        
        //失败
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
    }];
    
    
}

//刷新
-(void)setupRefresh{
    self.usersTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNews)];
    self.usersTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
}

//加载新数据
-(void)loadNews{
    HJFFoucsCategory *c = HJFSelectedCategory;
    c.currentPage = 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(c.id);
    params[@"page"] = @(c.currentPage);
    self.params = params;
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *users = [HJFusers mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        c.total = [responseObject[@"total"] integerValue];
        NSLog(@"%@",responseObject);
    
        [c.users removeAllObjects];
        [c.users addObjectsFromArray:users];
        if (self.params != params) {
            return ;
        }
        [self.usersTableView reloadData];
        [self.usersTableView.mj_header endRefreshing];
        [self checkFooterState];
 
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"加载失败");
         [self.usersTableView.mj_header endRefreshing];
    }];


}

//加载更多
-(void)loadMore{
    HJFFoucsCategory *c = self.categories[self.categoriesTableView.indexPathForSelectedRow.row];
    if (c.users.count == c.total) {
        NSLog(@"一样了。。。。。。。。。");
        [self.usersTableView.mj_footer endRefreshingWithNoMoreData];
        return;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"list";
        params[@"c"] = @"subscribe";
        params[@"category_id"] = @(c.id);
        params[@"page"] = @(++c.currentPage);
        self.params = params;
        [_manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSMutableArray *users = [HJFusers mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
            
            NSLog(@"%@",responseObject);
            
            [c.users addObjectsFromArray:users];
            if (self.params != params) {
                return ;
            }
            [self.usersTableView reloadData];
            [self.usersTableView.mj_footer endRefreshing];
            [self checkFooterState];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"加载失败");
        }];
    });
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.categoriesTableView) {
        return self.categories.count;

    }
    else{
         [self checkFooterState];
        return [HJFSelectedCategory users].count;

    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (tableView == self.categoriesTableView) {
        HJFLeftTableViewCell *cell= [HJFLeftTableViewCell cellInitWithTable:tableView];
        HJFFoucsCategory *leftTable = self.categories[indexPath.row];
        cell.leftTable=leftTable;
        return cell;
    }
    else{
        HJFusersCellTableViewCell *cell= [HJFusersCellTableViewCell cellInitWithTable:tableView];
         HJFFoucsCategory *category = self.categories[self.categoriesTableView.indexPathForSelectedRow.row];
        cell.user=category.users[indexPath.row];

        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.usersTableView.mj_footer endRefreshing];
    [self.usersTableView.mj_header endRefreshing];
    
    HJFFoucsCategory *c = self.categories[indexPath.row];
    if (c.users.count) {
        [self.usersTableView reloadData];
    }else{
        [self.usersTableView reloadData];
        [self.usersTableView.mj_header beginRefreshing];

      

       
    }
}

-(void)checkFooterState{
    HJFFoucsCategory *c = HJFSelectedCategory;
    self.usersTableView.mj_footer.hidden = (c.users.count ==0);
    if (c.users.count == c.total) {
        [self.usersTableView.mj_footer resetNoMoreData];
    }else{
        [self.usersTableView.mj_footer endRefreshing];
    
    }
    

}

-(void)dealloc{
    HJFLog(@"销毁了");
    [self.manager.operationQueue cancelAllOperations];

}


@end
