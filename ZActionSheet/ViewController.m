//
//  ViewController.m
//  ZActionSheet
//
//  Created by Zin_戦 on 16/6/13.
//  Copyright © 2016年 Zin戦壕. All rights reserved.
//

#import "ViewController.h"
#import "ZActionSheet.h"
@interface ViewController ()<ZActionSheetDelegate>
- (IBAction)momoda:(id)sender;
- (IBAction)papapa:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)momoda:(id)sender {
#pragma mark - 各种调用效果
    // 单文本居中

        NSMutableArray *actionSheetItems = [@[ZActionSheetTitleItemMake(ZActionSheetTypeNormal, @"拍照"),
                                              ZActionSheetTitleItemMake(ZActionSheetTypeNormal, @"从相册选取"),
                                              ZActionSheetTitleItemMake(ZActionSheetTypeHighlighted, @"删除")]
                                            mutableCopy];
        ZActionSheet *actionSheet = [[ZActionSheet alloc] initWithTitle:nil cancelTitle:nil items:actionSheetItems];
        // 展示并绑定选择回调
        [actionSheet showWithSelectedCompletion:^(NSInteger selectedIndex) {
//            ZActionSheetItem *item = actionSheetItems[selectedIndex];
            NSLog(@"---第%d个item被点击",selectedIndex);
        }];
}

- (IBAction)papapa:(id)sender {
    NSMutableArray *actionSheetItems = [@[ZActionSheetTitleItemMake(ZActionSheetTypeNormal, @"拍照"),
                                          ZActionSheetTitleItemMake(ZActionSheetTypeNormal, @"从相册选取"),
                                          ZActionSheetTitleItemMake(ZActionSheetTypeHighlighted, @"删除")]
                                        mutableCopy];
    ZActionSheet *actionSheet = [[ZActionSheet alloc] initWithTitle:@"头部title" cancelTitle:nil items:actionSheetItems];
    // 展示并绑定选择回调
    [actionSheet showWithSelectedCompletion:^(NSInteger selectedIndex) {
//        ZActionSheetItem *item = actionSheetItems[selectedIndex];
        NSLog(@"---第%d个item被点击",selectedIndex);
    }];
}
@end
