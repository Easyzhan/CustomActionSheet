//
//  ZActionSheetItem.m
//  ZActionSheet
//
//  Created by Zin_戦 on 16/6/13.
//  Copyright © 2016年 Zin戦壕. All rights reserved.
//

#import "ZActionSheetItem.h"

@implementation ZActionSheetItem

+ (instancetype)itemWithType:(ZActionSheetType)type image:(UIImage *)image title:(NSString *)title tintColor:(UIColor *)tintColor {
    
    ZActionSheetItem *item = [[ZActionSheetItem alloc] init];
    item.type  = type;
    item.image = image;
    item.title = title;
    item.tintColor = tintColor;
    
    return item;
}

@end
