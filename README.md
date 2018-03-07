# LLXAlertPop
![image](https://github.com/lilinxuan/LLXAlertPop/blob/master/弹出选项.gif)
![image](https://github.com/lilinxuan/LLXAlertPop/blob/master/图片文字.png)

一个UIView的分类完成的弹出列表，使用简单一句代码直接调用

使用方法

   
array ：弹出的选项标题
arrayImage ：数组图标，没有写nil
textColor ：选项标题的字体颜色 设置和标题对应的数组颜色或者单个颜色（NSArray/UIColor）     
font ：选项标题的字体
spacing ：文字与图片间距自行调试（无图片可填0）     
取消 按钮字体请到.m文件自行设置。默认黑色-16号
     
    
    NSArray *arrayTitle = @[@"我是第一个",@"我是第二个",@"我是第三个",@"我是第四个",@"我是第五个",@"我是第N..."];
    NSArray *arrayImage = @[@"zhifubao",@"weixin",@"zhifubao",@"weixin",@"zhifubao",@"weixin"];

    
    //字体颜色  二选一 数组颜色/单个颜色
    NSArray *arrayColor = @[[UIColor redColor],[UIColor blueColor],[UIColor orangeColor],[UIColor blackColor],[UIColor grayColor],[UIColor greenColor]];
    UIColor *color = [UIColor orangeColor];
    
    [self.view createAlertViewTitleArray:arrayTitle arrayImage:arrayImage textColor:arrayColor font:[UIFont systemFontOfSize:16] spacing:-15 actionBlock:^(UIButton * _Nullable button, NSInteger didRow) {
        //获取点击事件
        NSLog(@"%@,%ld",button.currentTitle,(long)didRow);
        lab.text = [NSString stringWithFormat:@"%@,下标%ld",button.currentTitle,(long)didRow];
    }];
		
		
如果对您有用请右上角点个 star，谢谢咯~
如发现bug请lssues我~
	
