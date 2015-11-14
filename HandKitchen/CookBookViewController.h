//
//  CookBookViewController.h
//  HandKitchen
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import "HomeViewController.h"

@interface CookBookViewController : HomeViewController <UITableViewDataSource, UITableViewDelegate>{

    UITableView *myTableView;
    NSMutableArray *dataArr;
}
@end
