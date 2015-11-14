//
//  CookBookModel.m
//  HandKitchen
//
//  Created by qianfeng on 15-7-7.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import "CookBookModel.h"

@implementation CookBookModel

- (instancetype)init{
    
    if (self = [super init]) {
        self.vegetableList = [NSArray array];
    }
    
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

- (id)valueForUndefinedKey:(NSString *)key{
    
    return nil;
}

@end
