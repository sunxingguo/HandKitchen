//
//  FactoryUI.h
//  HandKitchen
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//UI工厂，用来产生重复的UI控件
@interface FactoryUI : NSObject

//创建首页上的标题BBI（背景图片）
+ (UIBarButtonItem *)CreateProjectTitleBBI;

//创建用来调整BBI位置的一个占位的BBI

//@param Width 这个宽度是你要调整的宽度，可以为负数，负数就是相反方向
+ (UIBarButtonItem *)CreateSpaceBBIWithWidth:(CGFloat)Width;

//创建应用返回的BBI
//@param target 事件的目标对象     @param action 事件的函数
+ (UIBarButtonItem *)CreateBackBBIWithTarget:(id)target
                                      action:(SEL)action;

//创建应用的分割线
+ (UIBarButtonItem *)CreateSplitLineBBI;

//创建只带标题的BBI
+ (UIBarButtonItem *)CreateTitleBBI:(NSString *)title
                             target:(id)target
                             action:(SEL)action;

//创建掌厨通用的BBI
+ (UIBarButtonItem *)CreatePKBBIWithTitle:(NSString *)title
                                    image:(UIImage *)image
                                   target:(id)target
                                   action:(SEL)action;

//创建通用的背景颜色
+ (UIColor *)CreateVCBackColor;

//创建整个应用的主题色
+ (UIColor *)CreateThemeColor;

@end
