//
//  CookBookViewController.m
//  HandKitchen
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import "CookBookViewController.h"
#import "CookBookTableViewCell.h"
#import "FQinterface.h"
#import "FQNetwork.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperationManager.h"
#import "UIImageView+WebCache.h"
#import "CookBookModel.h"
#import "EGOCache.h"
#import "CircleView.h"

@interface CookBookViewController ()
@property (nonatomic, strong) CircleView *circleView;

@end

@implementation CookBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    [self.view addSubview:myTableView];
    
    dataArr = [NSMutableArray array];
    
    [self requestWeb];
    [self configUI];
    [self requestImage];
}

- (void)configUI{
    
    self.circleView = [CircleView circleViewFrame:CGRectMake(0, 0, self.view.bounds.size.width, 190)];
    
    myTableView.tableHeaderView = self.circleView;
}

- (void)requestImage{

//    is_traditional=0
//    phonetype=1
    if ([[EGOCache globalCache] hasCacheForKey:@"Banan"]) {
        
        self.circleView.imageUrlArray = (NSArray *)[[EGOCache globalCache] objectForKey:@"Banan"];
        return;
    } else {NSDictionary *params = @{@"is_traditional":@"0",
                             @"phonetype":@"1"};
    [AFHTTPRequestOperationManager GETRequest:URL_COOKBOOK_AD parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"\n%@", operation.responseObject);
        
        NSMutableArray *bananArray = [NSMutableArray array];
        
        for (NSDictionary *dic in [operation.responseObject objectForKey:@"data"]) {
            
            [bananArray addObject:dic[@"imageFilename"]];
        }
        
        [self.circleView setImageUrlArray:bananArray];
        
        [[EGOCache globalCache] setObject:bananArray forKey:@"Banan"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //NSLog(@"\n%@", operation.responseObject);
    }];
    }
}

- (void)requestWeb{
    
//    is_traditional=0
//    page=1
//    pageRecord=3
//    phonetype=1
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    if ([[EGOCache globalCache] hasCacheForKey:@"huluwa"]) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        id cacheData = [[EGOCache globalCache] plistForKey:@"huluwa"];
        
        NSArray *array = [cacheData objectForKey:@"data"];
        for (NSDictionary *dic in array) {
            CookBookModel *cookBookModel = [[CookBookModel alloc] init];
            
            [cookBookModel setValuesForKeysWithDictionary:dic];
            
            [dataArr addObject:cookBookModel];
        }
        
        [myTableView reloadData];
        
    } else {NSDictionary *params = @{@"is_traditional":@"0",
                             @"page":@"1",
                             @"pageRecord":@"3",
                             @"phonetype":@"1"};
    
    [AFHTTPRequestOperationManager GETRequest:URL_COOKBOOK parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"\n%@", operation.responseObject);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        [[EGOCache globalCache] setPlist:operation.responseObject forKey:@"huluwa"];
        
        NSArray *array = [operation.responseObject objectForKey:@"data"];
        for (NSDictionary *dic in array) {
            CookBookModel *cookBookModel = [[CookBookModel alloc] init];
            
            [cookBookModel setValuesForKeysWithDictionary:dic];
            
            [dataArr addObject:cookBookModel];
        }
        
        [myTableView reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //NSLog(@"\n%@", operation.responseObject);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
    }
}

#pragma mark - tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellID = @"cellName";
    CookBookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CookBookTableViewCell" owner:self options:nil] lastObject];
    }
    
    CookBookModel *model = dataArr[indexPath.row];

    [cell configWithModel:model indexPath:indexPath];
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.hotImage.hidden = NO;
    } else {
        cell.hotImage.hidden = YES;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 154;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return dataArr.count;
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
