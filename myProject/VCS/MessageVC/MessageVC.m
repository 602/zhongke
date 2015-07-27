//
//  MessageVC.m
//  myProject
//
//  Created by Apple on 15/5/31.
//  Copyright (c) 2015年 王涛. All rights reserved.
//

#import "MessageVC.h"

@interface MessageVC ()

@end

@implementation MessageVC

#pragma mark - Life cycle
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"消息";
        self.tabBarItem.image = [UIImage imageNamed:@"icon_parent1"];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_parent2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private method
- (void)initNavigationBar {
    self.title = @"消息";
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
