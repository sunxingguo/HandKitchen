//
//  HomeViewController.m
//  HandKitchen
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import "HomeViewController.h"
#import "FactoryUI.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self HomeVCSetupUI];
}

- (void)HomeVCSetupUI{
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:254/255.0f green:120/255.0f blue:20/255.0f alpha:1];
    
    //设置页面左上角的标题
    self.navigationItem.leftBarButtonItems = @[[FactoryUI CreateSpaceBBIWithWidth:-10], [FactoryUI CreateProjectTitleBBI]];
    
    //设置页面的背景颜色
    self.view.backgroundColor = [FactoryUI CreateVCBackColor];
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
