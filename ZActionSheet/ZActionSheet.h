//
//  ZActionSheet.h
//  ZActionSheet
//
//  Created by Zin_戦 on 16/6/13.
//  Copyright © 2016年 Zin戦壕. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZActionSheetItem.h"
#import "ZActionSheetConfig.h"

@class ZActionSheet;
@protocol ZActionSheetDelegate <NSObject>

@optional
- (void)ZActionSheet:(ZActionSheet *)actionSheet selectedIndex:(NSInteger)selectedIndex;

@end
@interface ZActionSheet : UIView

@property (nonatomic,weak) id<ZActionSheetDelegate> delegate;
@property (nonatomic, assign) ZContentAlignment contentAlignment; ///< 默认是ZContentAlignmentCenter.
@property (nonatomic, assign) BOOL hideOnTouchOutside; ///< 是否开启点击半透明层隐藏弹窗, 默认为YES.

/*! @author Steven
 *  @brief 单文本选项快速初始化
 *  @param title                  标题
 *  @param delegate               代理
 *  @param cancelButtonTitle      取消按钮标题
 *  @param highlightedButtonTitle 高亮按钮标题
 *  @param otherButtonTitles      其他按钮标题集合
 */
- (instancetype)initWithTitle:(NSString *)title delegate:(id<ZActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle highlightedButtonTitle:(NSString *)highlightedButtonTitle otherButtonTitles:(NSArray<NSString *> *)otherButtonTitles;

/*! @author Steven
 *  @brief 在外部组装选项按钮item
 *  @param title       标题
 *  @param cancelTitle 取消按钮标题
 *  @param items       选项按钮item
 */
- (instancetype)initWithTitle:(NSString *)title cancelTitle:(NSString *)cancelTitle items:(NSArray<ZActionSheetItem *> *)items;

/*! @author Steven
 *  @brief 单展示, 不绑定block回调
 */
- (void)show;

/*! @author Steven
 *  @brief 展示并绑定block回调
 *  @param selectedHandler 选择选项按钮回调.
 */
- (void)showWithSelectedCompletion:(ZActionSheetHandler)selectedHandler;
@end
