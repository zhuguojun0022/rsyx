//
//  EPSecurityManager.h
//  EPSecurityAuthSDK
//
//  Created by shi on 2018/6/14.
//  Copyright © 2018年 epsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "EPSecReq.h"

typedef void(^CompletionHandler)(NSDictionary *resultDict);
typedef void(^OnLoadingHandler)(UIView *targetView);

@interface EPSecurityManager : NSObject

+ (instancetype)defaultManager;

/**
 初始化
 @param configDict platform和apikey是必须的,不设置会触发断言
 */
+ (void)setupWithConfig:(NSDictionary *)configDict;

/**
 开启日志 YES: 开启, NO:禁用
 */
+ (void)enableLogging:(BOOL)logging;

/**
 是否使用调试地址  YES: 使用测试地址, NO: 正式地址
 */
+ (void)enableDebugging:(BOOL)debugging;

/**
 获取支付authToken
 */
+ (void)fetchToken:(EPSecSyncInfoReq *)req
         onLoading:(OnLoadingHandler)loadingHandler
          callback:(CompletionHandler)handler;


/**
 获取用户信息
 */
+ (void)getUser:(NSDictionary *)paramDic
         onLoading:(OnLoadingHandler)loadingHandler
          callback:(CompletionHandler)handler;



/**
 实人认证
 */
+ (void)authWithReq:(EPSecRealAuthReq *)req
          onLoading:(OnLoadingHandler)loadingHandler
           callback:(CompletionHandler)handler;


/**
 处理支付宝认证返回数据
 */
+ (void)handleOpenURL:(NSURL *)url;


/**
 平台信息同步
 
+ (void)syncInfo:(EPSecSyncInfoReq *)req
        callback:(CompletionHandler)handler;
 */

/**
 支付业务开通
 */
+ (void)openPay:(EPSecSyncInfoReq *)req
        callback:(CompletionHandler)handler;

/**
 忘记支付密码
 */
+ (void)fogetPayPassword:(EPSecSyncInfoReq *)req
                callback:(CompletionHandler)handler;

/**
 修改支付密码
 */
+ (void)modifyPayPassword:(EPSecSyncInfoReq *)req
                callback:(CompletionHandler)handler;

@end



