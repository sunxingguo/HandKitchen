//
//  SquareViewController.m
//  HandKitchen
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import "SquareViewController.h"
#import "SquareTableViewCell.h"
#import "FQinterface.h"
#import "FQNetwork.h"
#import "UIImageView+WebCache.h"
#import "AFHTTPRequestOperationManager.h"
#import "PlazaModel.h"
#import "EGOCache.h"

@interface SquareViewController ()

@end

@implementation SquareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    
    dataArr = [NSMutableArray array];
    
    [self requestWeb];
}

- (void)requestWeb{
    
    if ([[EGOCache globalCache] hasCacheForKey:@"qqq"]) {
        
        id cacheData = [[EGOCache globalCache] plistForKey:@"qqq"];
        
        NSArray *array = [cacheData objectForKey:@"data"];
        
        for (NSDictionary *dic in array) {
            PlazaModel *model = [[PlazaModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [dataArr addObject:model];
        }
        
        [myTableView reloadData];
    } else {
        NSDictionary *dic = @{@"is_traditional":@"0",
                          @"page":@"1",
                          @"pageRecord":@"30"};
    
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
        [AFHTTPRequestOperationManager GETRequest:URL_PLAZA parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
            //NSLog(@"\n%@", operation.responseObject);
        
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
            [[EGOCache globalCache] setPlist:operation.responseObject forKey:@"qqq"];
        
            NSArray *array = [operation.responseObject objectForKey:@"data"];
        
            for (NSDictionary *dic in array) {
            
                PlazaModel *model = [[PlazaModel alloc] init];
            
                [model setValuesForKeysWithDictionary:dic];
            
                [dataArr addObject:model];
            }
        
            [myTableView reloadData];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
            //NSLog(@"\n%@", operation.responseObject);
        
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        }];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellID = @"cellName";
    
    SquareTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SquareTableViewCell" owner:self options:nil] lastObject];
    }
    
    PlazaModel *model1 = dataArr[indexPath.row * 2];
    PlazaModel *model2 = dataArr[indexPath.row * 2 + 1];
    
    [cell configWithModel:model1 model:model2 indexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 140;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return dataArr.count / 2;
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
