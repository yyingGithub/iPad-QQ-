//
//  SYToolBarView.m
//  ipad项目－QQ屏幕适配
//
//  Created by 申颖 on 16/1/2.
//  Copyright © 2016年 Ying. All rights reserved.
//

#import "SYToolBarView.h"

@implementation SYToolBarView

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor blueColor];
        //创建三个按钮
        [self setupBtnWithImageName:@"tabbar_blog"];
        [self setupBtnWithImageName:@"tabbar_mood"];
        [self setupBtnWithImageName:@"tabbar_photo"];

    }
    return self;
}

//公用的创建按钮方法
-(void)setupBtnWithImageName:(NSString *)imageName{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    [self addSubview:button];
}

//屏幕适配的核心方法－重写layoutSubviews
-(void)layoutSubviews{

    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    for (int i=0; i<count; i++) {
        UIButton *btn = self.subviews[i];
        
        NSLog(@"btn.width=%f",btn.width);
        NSLog(@"btn.height=%f",btn.height);

        btn.width = SYDockMinWidth;
        btn.height = btn.width;
        //横屏
        if (SYLandscape) {
            btn.x = i*btn.width;
            btn.y = 0;
            
        }else{
        
            //竖屏
            btn.x = 0;
            btn.y = i*btn.height;
        }
    }
}
@end
