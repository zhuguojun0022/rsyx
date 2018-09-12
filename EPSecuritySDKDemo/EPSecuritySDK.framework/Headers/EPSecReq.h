//
//  EPSecReq.h
//  EPSecuritySDK
//
//  Created by shi on 2018/6/15.
//  Copyright © 2018年 epsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EPSecBaseReq : NSObject

@end

///实人认证入参
@interface EPSecRealAuthReq : EPSecBaseReq

@property (copy, nonatomic) NSString *certNum;      //身份证号码
@property (copy, nonatomic) NSString *name;      //姓名
@property (copy, nonatomic) NSString *returnPage;  //支付宝认证完成后的回跳地址

@end

//平台信息同步
@interface EPSecSyncInfoReq : EPSecBaseReq

@property (copy, nonatomic) NSString *name;      //姓名
@property (copy, nonatomic) NSString *cardNum;      //社保卡号
@property (copy, nonatomic) NSString *phoneNum;      //手机
@property (copy, nonatomic) NSString *password;      //登录密码

@property (copy, nonatomic) NSString *account;      //银行卡号
@property (copy, nonatomic) NSString *bankId;      //银行名称
@property (copy, nonatomic) NSString *cardType;      //卡类型
@property (copy, nonatomic) NSString *certNum;      //身份证号
@end


