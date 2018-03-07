//
//  ViewController.m
//  LLXAlertPop
//
//  Created by 李林轩 on 2018/3/5.
//  Copyright © 2018年 李林轩. All rights reserved.
//

#import "ViewController.h"
#import "UIView+LLXAlertPop.h"
#define APPSIZE [[UIScreen mainScreen] bounds].size

@interface ViewController ()
{
    UILabel *lab;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    /**
     *  注意事项：文件中引用了pop动画库，如果您项目中没有或者不想添加，请到 UIView+LLXAlertPop.m中注释掉动画代码
     *  array ：弹出的选项标题
     *  arrayImage ：数组图标
     *  textColor ：选项标题的字体颜色 可设置两种类型，数组颜色或者单个颜色（NSArray/UIColor）
     *  font ：选项标题的字体
     *  spacing ：文字与图片间距自行调试
     *  取消 按钮字体请到.m文件自行设置。默认黑色-16号
     **/
    
    
    self.title = @"弹弹弹，弹出鱼尾纹";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(85, 100, 200, 40);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"样式一（文字展示）" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(didTouchOne) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTwo.frame = CGRectMake(85, 160, 200, 40);
    btnTwo.backgroundColor = [UIColor orangeColor];
    [btnTwo setTitle:@"样式二（文字展示）" forState:UIControlStateNormal];
    btnTwo.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:btnTwo];
    [btnTwo addTarget:self action:@selector(didTouchTwo) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnThree = [UIButton buttonWithType:UIButtonTypeCustom];
    btnThree.frame = CGRectMake(85, 220, 200, 40);
    btnThree.backgroundColor = [UIColor blueColor];
    [btnThree setTitle:@"样式三（图标+文字展示）" forState:UIControlStateNormal];
    btnThree.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:btnThree];
    [btnThree addTarget:self action:@selector(didTouchThree) forControlEvents:UIControlEventTouchUpInside];
    
    lab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(btnThree.frame)+30, APPSIZE.width, 20)];
    lab.textColor = [UIColor redColor];
    lab.textAlignment = 1;
    [self.view addSubview:lab];
    
}

-(void)didTouchOne{
    
    NSArray *arrayTitle = @[@"我是第一个",@"我是第二个"];

    UIColor *color = [UIColor blueColor];
    
    [self.view createAlertViewTitleArray:arrayTitle textColor:color font:[UIFont systemFontOfSize:16] actionBlock:^(UIButton * _Nullable button, NSInteger didRow) {
        //获取点击事件
        NSLog(@"%@,%ld",button.currentTitle,(long)didRow);
        lab.text = [NSString stringWithFormat:@"%@,下标%ld",button.currentTitle,(long)didRow];
    }];
    
    
}
-(void)didTouchTwo{
    
    NSArray *arrayTitle = @[@"我是第一个",@"我是第二个",@"我是第三个",@"我是第四个",@"我是第五个",@"我是第六个"];
    
    NSArray *arrayColor = @[[UIColor redColor],[UIColor blueColor],[UIColor orangeColor],[UIColor blackColor],[UIColor grayColor],[UIColor greenColor]];
    
    [self.view createAlertViewTitleArray:arrayTitle textColor:arrayColor font:[UIFont systemFontOfSize:16] actionBlock:^(UIButton * _Nullable button, NSInteger didRow) {
        //获取点击事件
        NSLog(@"%@,%ld",button.currentTitle,(long)didRow);
        lab.text = [NSString stringWithFormat:@"%@,下标%ld",button.currentTitle,(long)didRow];
    }];
    
    
}

-(void)didTouchThree{
    
    NSArray *arrayTitle = @[@"支付宝支付",@"微信支付  "];
    
    NSArray *arrayImage = @[@"zhifubao",@"weixin"];

    
    [self.view createAlertViewTitleArray:arrayTitle arrayImage:arrayImage textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:16] spacing:-15 actionBlock:^(UIButton * _Nullable button, NSInteger didRow) {
        //获取点击事件
        NSLog(@"%@,%ld",button.currentTitle,(long)didRow);
        lab.text = [NSString stringWithFormat:@"%@,下标%ld",button.currentTitle,(long)didRow];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
