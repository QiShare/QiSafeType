//
//  AppDelegate.m
//  QiSafeType
//
//  Created by wangyongwang on 2019/2/19.
//  Copyright © 2019年 QiShare. All rights reserved.
//

#import "AppDelegate.h"
#import "QiSafeTypeViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    _window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[QiSafeTypeViewController new]];
    [_window makeKeyAndVisible];
    
    return YES;
}

@end
