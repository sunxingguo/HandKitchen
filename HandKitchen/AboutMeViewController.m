//
//  AboutMeViewController.m
//  HandKitchen
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import "AboutMeViewController.h"
#import "FactoryUI.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface AboutMeViewController ()

@end

@implementation AboutMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.rightBarButtonItem = [FactoryUI CreateTitleBBI:@"登录" target:self action:@selector(login)];
}

- (void)login{
    
    NSLog(@"\n阿里郎～阿里郎～阿拉里哟～～～");
    
    LoginViewController *lvc = [[LoginViewController alloc] init];
    
    lvc.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController pushViewController:lvc animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        return 64;
    } else {
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    static NSString *cellID = @"nasha";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    switch (section) {
        case 0:{
            cell.textLabel.text = @"我的信息";
            cell.imageView.image = [UIImage imageNamed:@"me_info"];
        }   break;
        case 1:{
            switch (row) {
                case 0:{
                    cell.textLabel.text = @"缓存视频";
                    cell.imageView.image = [UIImage imageNamed:@"me_videocache"];
                }   break;
                case 1:{
                    cell.textLabel.text = @"消息列表";
                    cell.imageView.image = [UIImage imageNamed:@"me_msg"];
                }   break;
                case 2:{
                    cell.textLabel.text = @"检查更新";
                    cell.imageView.image = [UIImage imageNamed:@"me_checkversion"];
                }   break;
                case 3:{
                    cell.textLabel.text = @"意见反馈";
                    cell.imageView.image = [UIImage imageNamed:@"me_feedback"];
                }   break;
                case 4:{
                    cell.textLabel.text = @"给我们评分";
                    cell.imageView.image = [UIImage imageNamed:@"me_grade"];
                }   break;
                case 5:{
                    cell.textLabel.text = @"关于我们";
                    cell.imageView.image = [UIImage imageNamed:@"me_about"];
                }   break;
                    
                    
                default:
                    break;
            }        }   break;
            
        default:
            break;
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
    } else {
        return 6;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
