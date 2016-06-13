//
//  ZActionSheetCell.m
//  ZActionSheet
//
//  Created by Zin_戦 on 16/6/13.
//  Copyright © 2016年 Zin戦壕. All rights reserved.
//

#import "ZActionSheetCell.h"
#import "ZActionSheetItem.h"

@interface ZActionSheetCell()

@property (nonatomic, strong) UIButton *titleButton;
@property (nonatomic,weak) UIView *topLine;
@end
@implementation ZActionSheetCell


- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted) {
        self.contentView.backgroundColor = ZColorWithString(ZActionSheetRowHighlightedColor);
    } else {
        [UIView animateWithDuration:0.25 animations:^{
            self.contentView.backgroundColor = self.backgroundColor;
        }];
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (!(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) return nil;
    
    self.backgroundColor = ZColorWithString(ZActionSheetRowNormalColor);
    self.contentView.backgroundColor = self.backgroundColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _contentAlignment = ZContentAlignmentCenter;
    
    [self setupSubviews];
    
    return self;
}

- (void)setupSubviews {
    _titleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _titleButton.tintColor = ZColorWithString(ZActionSheetItemNormalColor);
    _titleButton.titleLabel.font = [UIFont systemFontOfSize:ZActionSheetItemTitleFontSize];
    _titleButton.userInteractionEnabled = NO;
    _titleButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_titleButton];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_titleButton]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleButton)]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_titleButton]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleButton)]];
    
    // 顶部线条
    UIView *topLine = [[UIView alloc] init];
    topLine.backgroundColor = ZColorWithString(ZActionSheetRowTopLineColor);
    topLine.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:topLine];
    self.topLine = topLine;
    CGFloat lineHeight = 1/[UIScreen mainScreen].scale; ///< 线条高度
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[topLine]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(topLine)]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topLine(lineHeight)]" options:0 metrics:@{@"lineHeight":@(lineHeight)} views:NSDictionaryOfVariableBindings(topLine)]];
}

- (void)setItem:(ZActionSheetItem *)item {
    _item = item;
    
    // 前景色设置, 如果有自定义前景色则使用自定义的前景色, 否则使用预配置的颜色值.
    UIColor *tintColor;
    if (item.tintColor) {
        tintColor = item.tintColor;
    } else {
        if (_item.type == ZActionSheetTypeNormal) {
            tintColor = ZColorWithString(ZActionSheetItemNormalColor);
        } else {
            tintColor = ZColorWithString(ZActionSheetItemHighlightedColor);
        }
    }
    _titleButton.tintColor = tintColor;
    
    // 调整图片与标题的间距
    _titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, _item.image?-ZActionSheetItemContentSpacing/2:0,
                                                    _item.image?1:0, _item.image?ZActionSheetItemContentSpacing/2:0);
    _titleButton.titleEdgeInsets = UIEdgeInsetsMake(_item.image?1:0, _item.image?ZActionSheetItemContentSpacing/2:0,
                                                    0, _item.image?-ZActionSheetItemContentSpacing/2:0);
    // 设置图片与标题
    [_titleButton setTitle:item.title forState:UIControlStateNormal];
    [_titleButton setImage:item.image forState:UIControlStateNormal];
}

- (void)setContentAlignment:(ZContentAlignment)contentAlignment {
    if (_contentAlignment == contentAlignment) return;
    
    _contentAlignment = contentAlignment;
    // 更新button的图片和标题Edge
    [self updateButtonContentEdge];
    // 设置内容偏移
    switch (_contentAlignment) {
            // 局左
        case ZContentAlignmentLeft: {
            _titleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            _titleButton.contentEdgeInsets = UIEdgeInsetsMake(0, ZActionSheetDefaultMargin, 0, -ZActionSheetDefaultMargin);
            break;
        }
            // 居中
        case ZContentAlignmentCenter: {
            _titleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            _titleButton.contentEdgeInsets = UIEdgeInsetsZero;
            break;
        }
            // 居右
        case ZContentAlignmentRight: {
            _titleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            _titleButton.contentEdgeInsets = UIEdgeInsetsMake(0, -ZActionSheetDefaultMargin, 0, ZActionSheetDefaultMargin);
            break;
        }
    }
}

// 更新button图片与标题的edge
- (void)updateButtonContentEdge {
    if (!_item.image) return;
    if (_contentAlignment == ZContentAlignmentRight) {
        CGFloat titleWidth = [[_titleButton titleForState:UIControlStateNormal] sizeWithAttributes:@{NSFontAttributeName:_titleButton.titleLabel.font}].width;
        _titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth, 1, -titleWidth);
        _titleButton.titleEdgeInsets = UIEdgeInsetsMake(1, -_item.image.size.width-ZActionSheetItemContentSpacing,
                                                        0, _item.image.size.width+ZActionSheetItemContentSpacing);
    } else {
        _titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, -ZActionSheetItemContentSpacing/2, 1, ZActionSheetItemContentSpacing/2);
        _titleButton.titleEdgeInsets = UIEdgeInsetsMake(1, ZActionSheetItemContentSpacing/2, 0, -ZActionSheetItemContentSpacing/2);
    }
}

- (void)setHideTopLine:(BOOL)hideTopLine {
    _topLine.hidden = hideTopLine;
}

@end
