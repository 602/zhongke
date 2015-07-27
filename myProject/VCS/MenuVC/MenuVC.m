//
//  MenuVC.m
//  myProject
//
//  Created by Apple on 15/5/31.
//  Copyright (c) 2015年 王涛. All rights reserved.
//
/**
 * 使用自动布局解决适配问题。1：Xib ，2：Masonry
 * 1 主页使用XIB举例
 * 2 MenuCell.h 使用Masonry布局，纯代码
 * 3 首页测试页，写的都是示例
 */
#import "MenuVC.h"
#import "MenuCell.h"

@interface MenuVC ()

@end

@implementation MenuVC

#pragma mark - Life cycle
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"首页";
        self.tabBarItem.image = [UIImage imageNamed:@"icon_teacher1"];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_teacher2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

- (void)viewWillAppear:(BOOL)animated {

    [self downLoadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private method
- (void)initNavigationBar {
    self.title = @"首页";
    { // debug 环境下，显示测试页面入口
#if __DEBUG_VERSION
        [self setNavLeftItemWithName:@"测试" target:self action:@selector(didClickOnTestSelect:)];
#endif
    }
}
- (void)didClickOnTestSelect:(id)sender {
    TestViewControllerHome *testVCHomeIPhone = [[TestViewControllerHome alloc] init];
    testVCHomeIPhone.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:testVCHomeIPhone animated:YES];
}
- (void)downLoadData {
    
    [[NetWorkApi sharedNetWorkApi]groupInfoByID:4 success:^(id obj) {
        //UI展示
        QQLog(@"圈子列表:=============\n%@",obj);
    } failure:^(NSError *error) {
        QQLog(@"网络错误");
    }];
    
    [[NetWorkApi sharedNetWorkApi]storeList:nil success:^(id obj) {
        QQLog(@"店铺列表：%@",obj);
        //MMStoreListResponce * storeListResponce = obj;
        //UI展示

    } failure:^(NSError *error) {
        QQLog(@"网络错误");
    }];
    
    NSString *str = @"dddd";
    //[str textSizeWithFont:<#(UIFont *)#> constrainedToSize:<#(CGSize)#> lineBreakMode:<#(NSLineBreakMode)#>]
    //[UIUtils textSizeWithFont:<#(UIFont *)#> andTextString:<#(NSString *)#> andSize:<#(CGSize)#>]
}

#pragma mark - UITableViewDatasourse
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:menuCellIdentifier];
    if (!cell) {
        cell = [[MenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:menuCellIdentifier];
    }
    cell.model = self.dataArr[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return [MenuCell cellHeight];
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
}


#pragma mark - Getters and Setters
- (NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSArray array];
        //测试数据
        MenuCellModel *model1 = [[MenuCellModel alloc]initWithImg:@"me_icon08" Title:@"title1" SubTitle:@"subtitle1"];
         MenuCellModel *model2 = [[MenuCellModel alloc]initWithImg:@"me_icon07" Title:@"title2" SubTitle:@"subtitle2"];
         MenuCellModel *model3 = [[MenuCellModel alloc]initWithImg:@"me_icon06" Title:@"title3" SubTitle:@"subtitle3"];
        _dataArr = @[model1,model2,model3];
    }
    return _dataArr;
}
@end
