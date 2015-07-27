//
//  AppDelegate.m
//  myProject
//
//  Created by 王涛 on 15/5/28.
//  Copyright (c) 2015年 王涛. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginVC.h"
#import "RegistVC.h"
#import "MenuVC.h"
#import "FindVC.h"
#import "MessageVC.h"
#import "MeVC.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*
     * 获取定位服务许可
     */
    [self initCoreLocationService];
    /**
     * 开始定位服务
     */
    [self initLocationService];
    /*
     * 初始化网络接口
     */
    [self initNetwork];
    /*
     * 初始化支付
     */
    [self initPaymentService];
    /**
     * Fabric
     */
    [Fabric with:@[CrashlyticsKit]];
    /**
     *  窗口初始化
     */
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    //直接进入主页
    [self presentMenuViewController:NO];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    [self doCleanup];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark - Initialization

- (void)initCoreLocationService { // iOS 8 needed
    CLLocationManager *locationManager = [Utils locMgr];
    
    // fix ios8 location issue
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
#ifdef __IPHONE_8_0
        if ([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)])
        {
            [locationManager performSelector:@selector(requestAlwaysAuthorization)];//用这个方法，plist中需要NSLocationAlwaysUsageDescription
        }
        
        if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
        {
            [locationManager performSelector:@selector(requestWhenInUseAuthorization)];//用这个方法，plist里要加字段NSLocationWhenInUseUsageDescription
        }
#endif
    }
}
- (void)initLocationService {
    [[LocationService sharedLocationService] start];
}
- (void)doCleanup {
    //取消通知，停止各种服务
    [[LocationService sharedLocationService] stop];
}
- (void)initNetwork {
    //给网络请求设置基本URL
    [[NetWorkRequest sharedNetWorkRequest] setBasicURL:kApiBasePublicUrl];
}
- (void)initPaymentService {
    //FiXME:未完成
}
#pragma mark - Navigation control

- (void)replaceRootControllerBy:(UIViewController *)vc {
    UINavigationController *rootNavigationController = self.rootNavigationController;
    [rootNavigationController setViewControllers:[NSArray arrayWithObject:vc] animated:YES];
}

#pragma mark - Main view branching

// 欢迎页
- (void)presentTutorialViewController {
        //进入欢迎页
}

// 登录页：自动登录
- (void)presentSigninViewController { [self presentSigninViewController:NO]; };
- (void)presentSigninViewController:(BOOL)autoLogin {
    LoginVC *ctrl = [[LoginVC alloc] _initWithNib];
    ctrl.autoLogin = autoLogin;
    [self replaceRootControllerBy:ctrl];
}

// 注册页
- (void)presentRegistViewController {
    RegistVC *ctrl = [[RegistVC alloc] _initWithNib];
    [self replaceRootControllerBy:ctrl];
}

// 应用主页
- (void)presentMenuViewController:(BOOL)isStart {
    // 首页
    MenuVC *menuVC = [[MenuVC alloc] _initWithNib];
    UINavigationController *mnNav = [[UINavigationController alloc] initWithRootViewController:menuVC];
    
    [AppAppearance appearance];
    
    [self.window setRootViewController:mnNav];
}
// 弹出城市选择页
- (void)presentCitySelectViewController {
   
}

@end
