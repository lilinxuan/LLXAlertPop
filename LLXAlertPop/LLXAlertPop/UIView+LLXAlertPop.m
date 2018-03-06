//
//  UIView+LLXAlertPop.m
//  LLXAlertPop
//
//  Created by 李林轩 on 2018/3/5.
//  Copyright © 2018年 李林轩. All rights reserved.
//

#import "UIView+LLXAlertPop.h"
#import <objc/runtime.h>
#import "pop/POP.h"
#define APPSIZE [[UIScreen mainScreen] bounds].size
#define RGBA(r,g,b,a)                     [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

@implementation UIView (LLXAlertPop)
UIView *backgroundV;
UIView *bottomView;
float height;

static NSString *keyOfMethod; //关联者的索引key-用于获取block
/**
 *  array ：弹出的选项标题
 *  textColor ：选项标题的字体颜色 设置和标题对应的数组颜色或者单个颜色
 *  font ：选项标题的字体
 *  取消 按钮字体请到.m文件自行设置。默认黑色-16号
 **/
-(void)createAlertViewTitleArray:(NSArray* _Nullable )array textColor:(id)color font:(UIFont*_Nullable)font actionBlock:(LLXAlertBlock _Nullable )actionBlock{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    
    backgroundV = [[UIView alloc]initWithFrame:window.bounds];
    backgroundV.backgroundColor = RGBA(0, 0, 0, 0);

    [window addSubview:backgroundV];
    
    //点击手势
    UITapGestureRecognizer *touchDown = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didMiss)];
    touchDown.numberOfTapsRequired = 1;
    [backgroundV addGestureRecognizer:touchDown];
    
    height = array.count*45+array.count*1+52;
    
    bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, APPSIZE.height, APPSIZE.width, height+50)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [window addSubview:bottomView];

    NSArray *arrayColor;
    UIColor *colors;
   
    for (int i=0; i<array.count; i++) {
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, i*46, APPSIZE.width, 45)];
    
        [btn setTitle:array[i] forState:UIControlStateNormal];
       
        btn.tag = 10000+i;
        btn.titleLabel.font = font;
        [bottomView addSubview:btn];
        [btn addTarget:self action:@selector(didTitleBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn addTarget:self action:@selector(didTitleBtnHighlighted:) forControlEvents:UIControlEventTouchDown];
        [btn addTarget:self action:@selector(didTitleBtnNormal:) forControlEvents:UIControlEventTouchDragExit];
        //关联 block
        objc_setAssociatedObject (btn , &keyOfMethod, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
        if (i!=array.count-1) {
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(btn.frame), APPSIZE.width, 1)];
            line.backgroundColor = RGBA(230, 230, 230, 1);
            [bottomView addSubview:line];
        }
        //如果是数组颜色
        if ([color isKindOfClass:[NSArray class]]) {
            arrayColor = [NSArray arrayWithArray:color];
            colors = arrayColor[i];
        }else{
            colors = (UIColor*)color;
        }
         [btn setTitleColor:colors forState:UIControlStateNormal];
        
    }
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, array.count*46-1, APPSIZE.width, 8)];
    line.backgroundColor = RGBA(239, 239, 239, 1);
    [bottomView addSubview:line];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(line.frame), APPSIZE.width, 45)];
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [bottomView addSubview:btn];
    [btn addTarget:self action:@selector(didMiss) forControlEvents:UIControlEventTouchUpInside];
    
    /**
     如果您项目中没有pop动画库，或者您不想引入pop库，请注释掉pop动画和头文件， 并且打开下面的注释
    
    */
    //无动画
//    [UIView animateWithDuration:0.3 animations:^{
//        bottomView.frame = CGRectMake(0, APPSIZE.height-height, APPSIZE.width, height);
//    }];
    
    // pop动画
    POPSpringAnimation *anSpring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anSpring.toValue = @(bottomView.center.y-height);
    anSpring.springBounciness = 7.0f;
//    anSpring.springSpeed = 10.0f;
    [bottomView pop_addAnimation:anSpring forKey:@"position"];
    
    
    
    [UIView animateWithDuration:0.3 animations:^{
        backgroundV.backgroundColor = RGBA(0, 0, 0, 0.3);
    } completion:^(BOOL finished) {
        
    }];
    
}
-(void)didTitleBtnNormal:(UIButton*)btn{
    
    btn.backgroundColor = [UIColor clearColor];
}
-(void)didTitleBtnHighlighted:(UIButton*)btn{
    btn.backgroundColor = RGBA(239, 239, 239, 1);
}
//点击事件
-(void)didTitleBtn:(UIButton*)btn{
    
    btn.backgroundColor = [UIColor clearColor];
    //获取关联
    LLXAlertBlock block1 = (LLXAlertBlock)objc_getAssociatedObject(btn, &keyOfMethod);
    if(block1){
        block1(btn,btn.tag-10000);
        [self didMiss];
    }
    
    
}
//页面消失
-(void)didMiss{
    
    
    [UIView animateWithDuration:0.3 animations:^{
        backgroundV.backgroundColor = RGBA(0, 0, 0, 0);
        bottomView.frame = CGRectMake(0, APPSIZE.height, APPSIZE.width, height+50);
    } completion:^(BOOL finished) {
        [backgroundV removeFromSuperview];
        [bottomView removeFromSuperview];
    }];
    
    
}






@end
