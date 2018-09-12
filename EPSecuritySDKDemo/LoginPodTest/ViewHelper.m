//
//  ViewHelper.m
//  EPStandardizationAPP
//
//  Created by zhu guojun on 2018/5/4.
//  Copyright © 2018年 epsoft. All rights reserved.
//

#import "ViewHelper.h"

@implementation ViewHelper


/**
 *  创建搜索栏上的图标
 *  isLeft : 是否是左边图标
 */
+ (UIView *)createIconViewWith:(NSString *)imageName isLeft:(BOOL)isLeft
{
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 29, 29)];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    if (isLeft) {
        imgView.frame = CGRectMake(8, 8, 13, 13);
    }else{
        imgView.frame = CGRectMake(8, 5, 12, 18);
    }
    [tempView addSubview:imgView];
    return tempView;
}

//按钮文字和图片左右更换位置
+ (void)exchangeButtonTitleAndImage:(UIButton *)button title:(NSString *)title imageName:(NSString *)imageName andTitleFont:(UIFont *)font{
    
    CGSize size = CGSizeZero;
    UIImage *image = [UIImage imageNamed:imageName];
    
    if (title) {
        NSDictionary *attr = @{ NSFontAttributeName:font };
        size = [title sizeWithAttributes:attr];
    }
    
    if (!CGSizeEqualToSize(size,CGSizeZero)
        && image) {
        
        CGFloat w1 = size.width;
        
        CGFloat w2 = image.size.width;
        
        CGFloat space = 1;//UI_SCREEN_WIDTH-w1-w2;
        
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -space-w2, 0, space+w2);
        
        button.imageEdgeInsets = UIEdgeInsetsMake(0, space+w1,0,-space-w1);
    }
    
    [button setTitle:title forState:UIControlStateNormal];
    
}

@end
