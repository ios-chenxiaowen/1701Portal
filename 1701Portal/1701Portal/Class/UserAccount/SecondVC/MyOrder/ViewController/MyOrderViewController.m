//
//  MyOrderViewController.m
//  1701Portal
//
//  Created by ios小文 on 2022/3/10.
//

#import "MyOrderViewController.h"
#import "LiveHouseTableViewCell.h"
#import "lookOrderViewController.h"

@interface MyOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy) void(^scrollCallback)(UIScrollView *scrollView);
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataList;//数据源
@property (nonatomic,assign)NSInteger page;     //当前页数
@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    self.dataList = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view
}
- (void)bulidNavBar {
    
}

- (void)buildView {
    [self.view addSubview:self.tableView];
}
#pragma mark - 下拉刷新
-(void)headerRefresh{
    self.page = 1;
    [self loadListData];
    [self.tableView.mj_header endRefreshing];
}

#pragma mark - 上拉加载
-(void)loadMoreData{
    self.page++;
    [self loadListData];
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark - 加载数据
-(void)loadListData
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    param[@"current"] = [NSString stringWithFormat:@"%ld",(long)_page];
    param[@"size"] = @"10";
    
//    //筛选项
//    param[@"beginTime"] = _filterArr[0]; //开始时间
//    param[@"endTime"] = _filterArr[1]; //结束时间
//    param[@"corpCode"] = _filterArr[2];//供应商
//    param[@"productCode"] = _filterArr[3];//原料名称
//    param[@"contractNumber"] = _filterArr[4];  //合同编号
//    param[@"toraCode"] = _filterArr[5];  //托号
//
//    [self showLoading];
//    [[LgNetWorkTool sharedTool] requestPOST:JIA_inspectionDelivery_inspectionDeliveryList parames:param success:^(id responseObj) {
//
////        NSLog(@"%@",responseObj);
//
//        [self.tableView.mj_header endRefreshing];
//        [self.tableView.mj_footer endRefreshing];
//        [self stopLoading];
//        if ([responseObj[@"code"] isEqualToString:@"2"]) {
//            [self pushLoginViewController];
//
//        }else if ([responseObj[@"code"] isEqualToString:@"0"]){
//            NSMutableArray *arr = [LGModelTool dealWithMutableArrayResponseObject:responseObj andClass:[AcceptanceInToFactoryModel class] andKeyName:@"data"];
//            if (self.page > 1) {
//                //加载更多
//                if ([NSObject czf_isNullOrNilOrBankWithObject:arr]) {
//                    [MBProgressHUD showError:@"无更多数据"];
//                }else{
//                    [self.dataList addObjectsFromArray:arr];
//                }
//            }else{
//                self.dataList = arr;
//            }
//
//            [self.view addSubview:self.tableView];
//            [self.tableView reloadData];
//        }else{
//            [MBProgressHUD showError:responseObj[@"msg"]];
//        }
//
//    } failure:^(id error) {
//        NSLog(@"%@",error);
//        [self.tableView.mj_header endRefreshing];
//        [self.tableView.mj_footer endRefreshing];
//        [self.tableView reloadData];
//        [self stopLoading];
//        [MBProgressHUD showError:@"获取网络数据失败，请稍后再试"];
//    }];
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  10;
    return _dataList.count;
//    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LiveHouseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LiveHouseTableViewCell"];
    if (!cell) {
        cell = [[LiveHouseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LiveHouseTableViewCell"];
    }
    cell.indexPath = indexPath;
    __weak typeof(self) weakSelf = self;
    cell.cellBtnClickBlock = ^(NSIndexPath * _Nonnull indexPath) {
        LookOrderViewController * lookOrderVC = [[LookOrderViewController alloc] init];
        [weakSelf.navigationController  pushViewController:lookOrderVC animated:true];
        
    };
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.indexPath = indexPath;
//    cell.delegate = self;
//    cell.model = _dataList[indexPath.row];
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.scrollCallback ?: self.scrollCallback(scrollView);
}

#pragma mark - JXPagingViewListViewDelegate

- (UIView *)listView {
    return self.view;
}

- (UIScrollView *)listScrollView {
    return self.tableView;
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView *))callback {
    self.scrollCallback = callback;
}

- (void)listWillAppear {
    NSLog(@"%@:%@", self.title, NSStringFromSelector(_cmd));
}

- (void)listDidAppear {
    NSLog(@"%@:%@", self.title, NSStringFromSelector(_cmd));
}

- (void)listWillDisappear {
    NSLog(@"%@:%@", self.title, NSStringFromSelector(_cmd));
}

- (void)listDidDisappear {
    NSLog(@"%@:%@", self.title, NSStringFromSelector(_cmd));
}

#pragma mark - tableView 懒加载
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - NavgationbarHeight - JXheightForHeaderInSection) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[LiveHouseTableViewCell class] forCellReuseIdentifier:@"LiveHouseTableViewCell"];
    }
    return _tableView;
}

@end
