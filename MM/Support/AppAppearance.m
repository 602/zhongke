//
//  AppAppearance.m
//  QQing
//
//  Created by 王涛 on 5/20/15.
//
//

#import "AppAppearance.h"

@implementation AppAppearance

#pragma mark - Initialization

- (void)statusBarAppearance {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}

- (void)navigationBarAppearance {
    if (IOS7_OR_LATER) {
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:247.0/255 green:247.0/255 blue:247.0/255 alpha:1.0f]];
        [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:247.0/255 green:247.0/255 blue:247.0/255 alpha:1.0f]];
    } else {
        [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:247.0/255 green:247.0/255 blue:247.0/255 alpha:1.0f]];
    }
    
    [[UINavigationBar appearance] setTranslucent:NO];
    
    UIFont *font = [UIFont fontWithName:@"Arial-ItalicMT" size:20.0];
    UIColor *foregroundColor = [UIColor colorWithRed:051/255 green:051/255 blue:051/255 alpha:1.0f];
    UIColor *backgroundColor = [UIColor themeGreenColor];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          foregroundColor, NSForegroundColorAttributeName,
                                                          backgroundColor, NSBackgroundColorAttributeName,
                                                          font, NSFontAttributeName,
                                                          nil]];
}

- (void)tabBarItemAppearance {
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor lightGrayColor], NSForegroundColorAttributeName,
                                                       [UIFont systemFontOfSize:16.0], NSFontAttributeName,
                                                       nil]
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor themeGreenColor], NSForegroundColorAttributeName,
                                                       [UIFont systemFontOfSize:16.0], NSFontAttributeName,
                                                       nil]
                                             forState:UIControlStateSelected];
}

#pragma mark -

+ (instancetype)appearance {
    AppAppearance *appear = [AppAppearance new];
    
    [appear statusBarAppearance];
    [appear navigationBarAppearance];
    //[appear tabBarItemAppearance];
    
    return appear;
}

@end
