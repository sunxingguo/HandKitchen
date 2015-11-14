//
//  CookBookModel.h
//  HandKitchen
//
//  Created by qianfeng on 15-7-7.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CookBookModel : NSObject

@property (nonatomic, strong) NSString *imageFilename;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSArray *vegetableList;

@end
