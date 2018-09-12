//
//  ViewHelper.h
//  EPStandardizationAPP
//
//  Created by zhu guojun on 2018/5/4.
//  Copyright © 2018年 epsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewHelper : NSObject

/**
 *  创建搜索栏上的图标
 *  isLeft : 是否是左边图标
 */
+ (UIView *)createIconViewWith:(NSString *)imageName isLeft:(BOOL)isLeft;

//按钮文字和图片左右更换位置
+ (void)exchangeButtonTitleAndImage:(UIButton *)button title:(NSString *)title imageName:(NSString *)imageName andTitleFont:(UIFont *)font;

@end
