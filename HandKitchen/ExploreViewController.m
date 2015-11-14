//
//  ExploreViewController.m
//  HandKitchen
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import "ExploreViewController.h"

@interface ExploreViewController ()

@end

@implementation ExploreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    
    //设置代理
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    //设置静态标识符
    static NSString *cellID = @"cellName";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    switch (section) {
        case 0:{
            if (row == 0) {
                cell.textLabel.text = @"食材大全";
                cell.imageView.image = [UIImage imageNamed:@"expl_food"];
            } else if (row == 1){
                cell.textLabel.text = @"家电厨具佳肴";
                cell.imageView.image = [UIImage imageNamed:@"expl_household"];
            } else {
                cell.textLabel.text = @"卖汤汤";
                cell.imageView.image = [UIImage imageNamed:@"expl_soup"];
            }
        }   break;
        case 1:{
            if (row == 0) {
                cell.textLabel.text = @"摇一摇";
                cell.imageView.image = [UIImage imageNamed:@"expl_shake"];
            } else {
                cell.textLabel.text = @"扫一扫";
                cell.imageView.image = [UIImage imageNamed:@"expl_scan"];
            }
        }   break;
        case 2:{
            if (row == 0) {
                cell.textLabel.text = @"发现搜索";
                cell.imageView.image = [UIImage imageNamed:@"expl_found"];
            } else {
                cell.textLabel.text = @"新书推荐";
                cell.imageView.image = [UIImage imageNamed:@"expl_newbook"];
            }
        }   break;
            
        default:
            break;
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 64;
    } else {
        return 10;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 3;
    }else{
        return 2;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
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
