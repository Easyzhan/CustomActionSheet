//
//  ZActionSheetConfig.m
//  ZActionSheet
//
//  Created by Zin_戦 on 16/6/13.
//  Copyright © 2016年 Zin戦壕. All rights reserved.
//

#import "ZActionSheetConfig.h"

// float
CGFloat const ZActionSheetDefaultMargin      = 10;     ///< 默认边距 (标题四边边距, 选项靠左或靠右时距离边缘的距离)
CGFloat const ZActionSheetContentMaxScale    = 0.65;   ///< 弹窗内容高度与屏幕高度的默认比例
CGFloat const ZActionSheetRowHeight          = 44;     ///< 行高
CGFloat const ZActionSheetTitleLineSpacing   = 2.5;    ///< 标题行距
CGFloat const ZActionSheetTitleKernSpacing   = 0.5;    ///< 标题字距
CGFloat const ZActionSheetItemTitleFontSize  = 16;     ///< 选项文字字体大小, default is 16.
CGFloat const ZActionSheetItemContentSpacing = 5;      ///< 选项图片和文字的间距
// color
NSString * const ZActionSheetTitleColor           = @"#888888"; ///< 标题颜色
NSString * const ZActionSheetBackColor            = @"#E8E8ED"; ///< 背景颜色
NSString * const ZActionSheetRowNormalColor       = @"#FBFBFE"; ///< 单元格背景颜色
NSString * const ZActionSheetRowHighlightedColor  = @"#F1F1F5"; ///< 选中高亮颜色
NSString * const ZActionSheetRowTopLineColor      = @"#D7D7D8"; ///< 单元格顶部线条颜色
NSString * const ZActionSheetItemNormalColor      = @"#000000"; ///< 选项默认颜色
NSString * const ZActionSheetItemHighlightedColor = @"#E64340"; ///< 选项高亮颜色