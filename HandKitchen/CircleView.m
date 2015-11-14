//
//  CircleView.m
//  HandKitchen
//
//  Created by qianfeng on 15-7-7.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import "CircleView.h"
#import "UIImageView+WebCache.h"
#import "UIImage+SDImageCacheExtension.h"

@interface CircleView ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation CircleView

+ (instancetype)circleViewFrame:(CGRect)frame{

    //初始化
    CircleView *view = [[CircleView alloc] initWithFrame:frame];
    view.scrollView = [[UIScrollView alloc] initWithFrame:frame];
    view.scrollView.pagingEnabled = YES;
    [view addSubview:view.scrollView];
    
    //初始化定时器
    view.timer = [NSTimer scheduledTimerWithTimeInterval:3.f target:view selector:@selector(scrollBanan) userInfo:nil repeats:YES];
    
    [view closeTimer];
    
    return view;
}

- (void)scrollBanan{
    
    //判断是否滚动到最后一张图片的偏移量，如果偏移量归0，显示第一张图片
    if (self.scrollView.contentOffset.x >= self.scrollView.contentSize.width - self.scrollView.frame.size.width) {
        self.scrollView.contentOffset = CGPointMake(0, 0);
    }
    //不是则继续滚动
    else{
        self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x + self.scrollView.frame.size.width, 0);
    }
}

//更新滚动视图
- (void)setImageUrlArray:(NSArray *)imageUrlArray{
 
    _imageUrlArray = imageUrlArray;
    //NSLog(@"\nimageUrlArray = %@", imageUrlArray);
    
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.bounds)*imageUrlArray.count, CGRectGetHeight(self.bounds)*imageUrlArray.count);
    
    NSLog(@"\n count = %lu", (unsigned long)self.scrollView.subviews.count);
    
    for (UIView *addView in self.scrollView.subviews) {
        
        //移除视图
        [addView removeFromSuperview];
    }
    
    for (NSInteger i = 0; i < imageUrlArray.count; i++) {
            
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bounds) * i, 0, self.bounds.size.width, self.bounds.size.height)];
        
        imageView.image = [UIImage cachedImageWithURL:imageUrlArray[i]];
        
        if (!imageView.image) {
            
            [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrlArray[i]]];
        }
        
        [self.scrollView addSubview:imageView];
            
    }
        
    [self openTimer];
    
}

- (void)openTimer{

    [self.timer setFireDate:[NSDate distantPast]];
}

- (void)closeTimer{
    [self.timer setFireDate:[NSDate distantPast]];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
