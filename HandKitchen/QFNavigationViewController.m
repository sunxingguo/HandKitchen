//
//  QFNavigationViewController.m
//  HandKitchen
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import "QFNavigationViewController.h"

@interface QFNavigationViewController () <UIGestureRecognizerDelegate>

@end

@implementation QFNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //更新状态栏风格，这种写法，如果有navigationController一定要在NavigationController里面设置
    [self setNeedsStatusBarAppearanceUpdate];
    
    //启用返回手势需要添加这个手势的delegate属性
    self.interactivePopGestureRecognizer.delegate = self;
    
    //设置标题的颜色和字体
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:21]};
}

#pragma mark - gestureRecognizerDelegate
//返回状态栏风格
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    if (self.viewControllers.count <= 1) {
        return NO;
    }
    
    return YES;
}

//重写这个方法来启用返回手势
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    [super pushViewController:viewController animated:animated];
    self.interactivePopGestureRecognizer.enabled = YES;
}

//重写这个方法来判断启用和禁用返回手势
- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    
    UIViewController *vc = [super popViewControllerAnimated:animated];
    
    //iOS7返回手势的启用和禁用
    if (self.viewControllers.count > 0) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }else{
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    return vc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
