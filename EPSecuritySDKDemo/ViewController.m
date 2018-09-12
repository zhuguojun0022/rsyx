//
//  ViewController.m
//  EPSecuritySDKDemo
//
//  Created by shi on 2018/6/15.
//  Copyright © 2018年 epsoft. All rights reserved.
//

#import "ViewController.h"
#import <EPSecuritySDK/EPSecuritySDK.h>
#import "MBProgressHUD.h"
#import "NSDictionary+Log.h"
#import "NSArray+Log.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc
{
    NSLog(@"释放");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//"account": "1954052297290776685",
//"cardNum": "QWER12351",
//"cardState": "1",
//"cardType": "100",
//"certNum": "341126198712311232",
//"citCardNum": "32200700002500342222",
//"code": "1000",
//"hospMobpay": "1",
//"idCode": "89534599753965241",
//"image": "",
//"isAuth": "1",
//"msg": "\u53D6\u5361\u4FE1\u606F\u6210\u529F!",
//"name": "\u8C37\u95EE"

- (IBAction)authToen:(id)sender {
    EPSecSyncInfoReq *req = [self getNormalUserInfo];
    
    __block MBProgressHUD *hud = nil;
    [EPSecurityManager fetchToken:req onLoading:^(UIView *targetView) {
         hud = [MBProgressHUD showHUDAddedTo:targetView animated:YES];
        NSLog(@"onLoading____________");
    } callback:^(NSDictionary *resultDict) {
        NSLog(@"___打印___%@",resultDict);
        [hud removeFromSuperview];
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabel.text = resultDict[@"message"];
        [hud hideAnimated:YES afterDelay:1.5f];
    }];
    
    
    /*
    [EPSecurityManager fetchToken:req onLoading:nil callback:^(NSDictionary *resultDict) {
        NSLog(@"___打印___%@",resultDict);
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabel.text = resultDict[@"message"];
        [hud hideAnimated:YES afterDelay:1.5f];
    }];
     */
    
    
}

//获取用户参数
- (EPSecSyncInfoReq *)getNormalUserInfo{
    EPSecSyncInfoReq *req = [[EPSecSyncInfoReq alloc] init];
    req.account = @"1954052297290776685";
    req.bankId = @"浙江农商银行";
    req.cardNum = @"QWER12351";
    req.cardType = @"100";
    req.certNum = @"341126198712311232";
    req.name = @"谷问";
    req.phoneNum = @"13516804503";
    req.password = @"123456";
    return req;
}

//获取用户信息
- (IBAction)getUserInfo:(id)sender{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
    dic[@"certNum"] = @"341126198712311237";
    dic[@"name"] = @"谷问";
    [EPSecurityManager getUser:dic onLoading:nil callback:^(NSDictionary *resultDict) {
        NSLog(@"resultDict: %@",resultDict);
    }];
}

- (IBAction)authRealPerson:(id)sender {
    
    EPSecRealAuthReq *req = [[EPSecRealAuthReq alloc] init];
    req.certNum = @"341126198712311232";
    req.name = @"谷问";
    req.returnPage = @"EPSecuritySDKDemo://";
    
    
    __block MBProgressHUD *hud = nil;
    [EPSecurityManager authWithReq:req onLoading:^(UIView *targetView) {
        NSLog(@"onLoading____________");
        if (!hud) {
            hud = [MBProgressHUD showHUDAddedTo:targetView animated:YES];
        }
    } callback:^(NSDictionary *resultDict) {
        NSLog(@"___打印___%@",resultDict);
        [hud removeFromSuperview];
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabel.text = resultDict[@"message"];
        [hud hideAnimated:YES afterDelay:1.5f];
    }];
    
    
   /*
    [EPSecurityManager authWithReq:req onLoading:nil callback:^(NSDictionary *resultDict) {
        NSLog(@"___打印___%@",resultDict);
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabel.text = resultDict[@"message"];
        [hud hideAnimated:YES afterDelay:1.5f];
    }];
   */
    
}

//开通支付业务
- (IBAction)openPay:(id)sender{
   EPSecSyncInfoReq *req = [self getNormalUserInfo];

    [EPSecurityManager openPay:req callback:^(NSDictionary *resultDict) {
        NSLog(@"resultDict: %@",resultDict);
    }];
}

//找回支付密码
- (IBAction)fogetPayPassword:(id)sender{
    EPSecSyncInfoReq *req = [self getNormalUserInfo];
    
    [EPSecurityManager fogetPayPassword:req callback:^(NSDictionary *resultDict) {
        NSLog(@"resultDict: %@",resultDict);
    }];
}

//修改支付密码
- (IBAction)modifyPayPassword:(id)sender{
    EPSecSyncInfoReq *req = [self getNormalUserInfo];
    
    [EPSecurityManager modifyPayPassword:req callback:^(NSDictionary *resultDict) {
        NSLog(@"resultDict: %@",resultDict);
    }];
}

@end




