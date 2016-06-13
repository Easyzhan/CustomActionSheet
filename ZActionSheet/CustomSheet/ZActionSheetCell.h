//
//  ZActionSheetCell.h
//  ZActionSheet
//
//  Created by Zin_戦 on 16/6/13.
//  Copyright © 2016年 Zin戦壕. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZActionSheetConfig.h"
@class ZActionSheetItem;

@interface ZActionSheetCell : UITableViewCell

@property (nonatomic, assign) ZContentAlignment contentAlignment;
@property (nonatomic, strong) ZActionSheetItem *item;
@property (nonatomic, assign) BOOL hideTopLine; //是否隐藏顶部线条

@end
