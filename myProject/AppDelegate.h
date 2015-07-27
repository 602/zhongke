//
//  AppDelegate.h
//  myProject
//
//  Created by 王涛 on 15/5/28.
//  Copyright (c) 2015年 王涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UINavigationController *rootNavigationController;

/**
 *  业务页面切换的时候使用
 *  替换根控制器（非UINavigationController）
 */
- (void)replaceRootControllerBy:(UIViewController *)vc;

@end

