//
//  LoginViewController.m
//  HandKitchen
//
//  Created by qianfeng on 15-7-8.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "FactoryUI.h"
#import "FQinterface.h"
#import "FQNetwork.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonCrypto.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self configUI];
}

- (void)configUI{
    
    self.navigationItem.rightBarButtonItem = [FactoryUI CreateTitleBBI:@"注册" target:self action:@selector(rightClick)];
    
    self.navigationItem.leftBarButtonItem = [FactoryUI CreateTitleBBI:@"我的" target:self action:@selector(leftClick)];
}

- (void)leftClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightClick{

    RegisterViewController *rvc = [[RegisterViewController alloc] init];
    
    [self.navigationController pushViewController:rvc animated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

- (NSString *)md5String: (NSString *)str{
    
    const char *cStr = [str UTF8String];
    unsigned char buff[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), buff);
    
    NSMutableString *result = [NSMutableString string];
    for (int i = 0; i < 16; i++) {
        [result appendFormat:@"%02x", buff[i]];
    }
    
    return result;
}

- (void)loginBtn:(UIButton *)sender{
 
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *params = @{@"loginName":self.phoneNumberTF.text,
                             @"password":[self md5String:self.passwordTF.text],
                             @"md5":@"3336",
                             @"is_traditional":@"0"};
    
    [manager POST:URL_Login parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"\n%@", operation.responseObject);
        if ([responseObject[@"starus"] isEqualToString:@"1"]) {
            NSLog(@"\n登录成功");
        } else {
            //登录失败
            NSLog(@"\n%@", responseObject);
            NSLog(@"\n%@", responseObject[@"message"]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"登录失败" message:@"用户名或密码错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alert show];
    }];
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
