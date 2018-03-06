//
//  UIView+LLXAlertPop.h
//  LLXAlertPop
//
//  Created by 李林轩 on 2018/3/5.
//  Copyright © 2018年 李林轩. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ActionBlock)(UIButton * _Nullable button,NSInteger didRow);
@interface UIView (LLXAlertPop)

/**
 *  array ：弹出的选项标题
 *  textColor ：选项标题的字体颜色
 *  font ：选项标题的字体
 *  取消 按钮字体请到.m文件自行设置。默认黑色-16号
 **/
-(void)createAlertViewTitleArray:(NSArray* _Nullable )array textColor:(UIColor*_Nullable)color font:(UIFont*_Nullable)font actionBlock:(ActionBlock _Nullable )actionBlock;
@end
