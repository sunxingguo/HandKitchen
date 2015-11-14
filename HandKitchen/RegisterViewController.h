//
//  RegisterViewController.h
//  HandKitchen
//
//  Created by qianfeng on 15-7-8.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import "HomeViewController.h"

@interface RegisterViewController : HomeViewController

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTF;

@property (weak, nonatomic) IBOutlet UITextField *nameTF;

@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@property (weak, nonatomic) IBOutlet UITextField *confirmTF;


- (IBAction)registerBtn:(UIButton *)sender;

@end
