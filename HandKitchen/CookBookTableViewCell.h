//
//  CookBookTableViewCell.h
//  HandKitchen
//
//  Created by qianfeng on 15-7-7.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CookBookModel.h"

@interface CookBookTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *titleImage;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *hotImage;

@property (weak, nonatomic) IBOutlet UIImageView *bgImageOne;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageTwo;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageThree;

@property (weak, nonatomic) IBOutlet UILabel *nameLabelOne;
@property (weak, nonatomic) IBOutlet UILabel *nameLabelTwo;
@property (weak, nonatomic) IBOutlet UILabel *nameLabelThree;

@property (nonatomic, strong) NSIndexPath *indexPath;

- (void)configWithModel:(CookBookModel *)model indexPath:(NSIndexPath *)indexPath;

@end
