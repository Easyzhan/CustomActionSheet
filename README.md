# CustomActionSheet
自定义的从屏幕地下钻出来的sheet，样式多多，欢迎试用
![](https://github.com/Easyzhan/CustomActionSheet/blob/master/dongxiao.gif)
```
用法
1.把CustomSheet拖拽到项目中
2.在需要弹出的时候写下：
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
        
3.initWithTitle可以是你要的标题字符串@“标题”

