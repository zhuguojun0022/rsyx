//
//  AppDelegate.m
//  EPSecuritySDKDemo
//
//  Created by shi on 2018/6/15.
//  Copyright © 2018年 epsoft. All rights reserved.
//

#import "AppDelegate.h"
#import <EPSecuritySDK/EPSecuritySDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSDictionary *config = @{
                             @"platform": @"HealthyYiwu-SDK",
                             @"apikey": @"1bb9ef00753f403e8df48be8bc779490",
                             @"returnPage": @"EPSecuritySDKDemo://",
                             @"backButtonImageName": @"tempBack",
                             @"navBgColor": @(0x2e92ff),
                             @"navTitleColor": @(0xffffff),
                             };
    [EPSecurityManager setupWithConfig:config];
    //开启日志
    [EPSecurityManager enableLogging:YES];
    //使用测试地址
    [EPSecurityManager enableDebugging:YES];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //支付宝实人认证回调
    if ([sourceApplication isEqualToString:@"com.alipay.iphoneclient"]) {
        [EPSecurityManager handleOpenURL:url];
        return YES;
    }
    
    return NO;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    NSString *sourceApplicationValue = options[UIApplicationOpenURLOptionsSourceApplicationKey];
    //支付宝实人认证回调
    if ([sourceApplicationValue isEqualToString:@"com.alipay.iphoneclient"]) {
        [EPSecurityManager handleOpenURL:url];
        return YES;
    }
    
    return NO;
}

@end



