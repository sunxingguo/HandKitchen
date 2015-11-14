//
//  SquareTableViewCell.h
//  HandKitchen
//
//  Created by qianfeng on 15-7-8.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlazaModel.h"

@interface SquareTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *titleImageOne;

@property (weak, nonatomic) IBOutlet UIImageView *titleImageTwo;

@property (weak, nonatomic) IBOutlet UILabel *titleLabelOne;

@property (weak, nonatomic) IBOutlet UILabel *titleLableTwo;

@property (weak, nonatomic) IBOutlet UIImageView *bgImageOne;

@property (weak, nonatomic) IBOutlet UIImageView *bgImageTwo;

@property (weak, nonatomic) IBOutlet UILabel *commentLabelOne;

@property (weak, nonatomic) IBOutlet UILabel *commentLabelTwo;

- (void)configWithModel:(PlazaModel *)model1 model:(PlazaModel *)model2 indexPath:(NSIndexPath *)indexPath;

@end
