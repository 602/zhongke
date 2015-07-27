//
//  FindVC.m
//  myProject
//
//  Created by Apple on 15/5/31.
//  Copyright (c) 2015年 王涛. All rights reserved.
//

#import "FindVC.h"

@interface FindVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FindVC

#pragma mark - Life cycle
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"发现";
        self.tabBarItem.image = [UIImage imageNamed:@"icon_student1"];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_student2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加滑动隐藏navigationBar和tabbar
    self.fullScreenScroll = [[RNFullScreenScroll alloc]initWithViewController:self scrollView:self.tableView];
    [self initNavigationBar];
    //测试定位功能
    [self locationTest];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private method
- (void)initNavigationBar {
    self.title = @"发现";
}

- (void)locationTest {

    [[LocationService sharedLocationService] start];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getUserLocationCity:) name:kNotificationGetUserLocation object:nil];
}

#pragma mark - Event responce
- (void)getUserLocationCity:(NSNotification*)notic {

    NSString *cityStr = [notic object];
    if (cityStr) {
        [[LocationService sharedLocationService] stop];
    }
    QQLog(@"定位城市名称：%@",cityStr);
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"test %ld",indexPath.row];
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
