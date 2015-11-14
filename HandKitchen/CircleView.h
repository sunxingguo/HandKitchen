//
//  CircleView.h
//  HandKitchen
//
//  Created by qianfeng on 15-7-7.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView

@property (nonatomic, strong) NSArray *imageUrlArray;


//实例化视图
+ (instancetype)circleViewFrame:(CGRect)frame;

- (void)openTimer;

- (void)closeTimer;

@end
