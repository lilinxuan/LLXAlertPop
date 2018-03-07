# LLXAlertPop
![image](https://github.com/lilinxuan/LLXAlertPop/blob/master/弹选项.gif)

UIView的分类完成的弹出列表，使用简单，一句代码直接调用

使用方法



    //样式一（更多样式请下载demo）
    NSArray *arrayTitle = @[@"我是第一个",@"我是第二个"];
    UIColor *color = [UIColor blueColor];
    
    [self.view createAlertViewTitleArray:arrayTitle textColor:color font:[UIFont systemFontOfSize:16] actionBlock:^(UIButton * _Nullable button, NSInteger didRow) {
        //获取点击事件
        NSLog(@"%@,%ld",button.currentTitle,(long)didRow);
        lab.text = [NSString stringWithFormat:@"%@,下标%ld",button.currentTitle,(long)didRow];
    }];
		
		
如果对您有用请右上角点个 star，谢谢咯~
如发现bug请lssues我~
	
