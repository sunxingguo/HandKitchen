//
//  RegisterViewController.m
//  HandKitchen
//
//  Created by qianfeng on 15-7-8.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import "RegisterViewController.h"
#import "FactoryUI.h"
#import <objc/runtime.h>
#import <CommonCrypto/CommonCrypto.h>
#import "FQNetwork.h"
#import "FQinterface.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self configUI];
}

- (void)configUI{
    
    self.navigationItem.leftBarButtonItem = [FactoryUI CreateTitleBBI:@"登录" target:self action:@selector(leftClick)];
}

- (void)leftClick{
    
    [self.navigationController popViewControllerAnimated:YES];
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

- (void)registerBtn:(UIButton *)sender{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:@"http://admin.izhangchu.com:80/HandHeldKitchenCommunity/api/user/users!register.do" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        //账号
        [formData appendPartWithFormData:[self.phoneNumberTF.text dataUsingEncoding:NSUTF8StringEncoding] name:@"loginName"];
        
        //昵称
        [formData appendPartWithFormData:[self.nameTF.text dataUsingEncoding:NSUTF8StringEncoding] name:@"userName"];
        
        //密码
        NSString *md5PassWord = [self md5String:self.confirmTF.text];
        
        [formData appendPartWithFormData:[md5PassWord dataUsingEncoding:NSUTF8StringEncoding] name:@"password"];
        
        //密码明文
        [formData appendPartWithFormData:[self.passwordTF.text dataUsingEncoding:NSUTF8StringEncoding] name:@"md5"];
        
        //固定值，写死
        [formData appendPartWithFormData:[@"0" dataUsingEncoding:NSUTF8StringEncoding] name:@"is_traditional"];
        
        //手机号
        [formData appendPartWithFormData:[self.phoneNumberTF.text dataUsingEncoding:NSUTF8StringEncoding] name:@"phone"];
        
        //固定值
        [formData appendPartWithFormData:[@"APP Store" dataUsingEncoding:NSUTF8StringEncoding] name:@"channel"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"\n%@", operation.responseObject[@"message"]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"\n%@", error);
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
