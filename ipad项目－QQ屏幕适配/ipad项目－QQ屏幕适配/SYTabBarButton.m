//
//  SYTabBarButton.m
//  ipad项目－QQ屏幕适配
//
//  Created by 申颖 on 16/1/4.
//  Copyright © 2016年 Ying. All rights reserved.
//

#import "SYTabBarButton.h"

@implementation SYTabBarButton

-(instancetype)initWithFrame:(CGRect)frame{

    self=[super initWithFrame:frame];
    if (self) {
        //设置按钮的统一背景颜色
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateDisabled];
        //NSLog(@"self.frame = %d", self.frame);
        //设置图像模式 －－－> 居中
        self.imageView.contentMode = UIViewContentModeCenter;
        
        //取消失效状态的按钮图像调整
        self.adjustsImageWhenDisabled = NO;
        
        //取消高亮状态的按钮图像调整
        self.adjustsImageWhenHighlighted = NO;

    }
    return self;
}

-(void)layoutSubviews{

    [super layoutSubviews];
    //调整label与image的位置
    if (SYLandscape) {
        //横屏
        self.imageView.width = self.width * 0.4;
        self.imageView.height = self.height;
        self.imageView.x = 0;
        self.imageView.y = 0;
        
        self.titleLabel.hidden = NO;
        self.titleLabel.width = self.width - self.imageView.width;
        self.titleLabel.height = self.height;
        self.titleLabel.x = self.imageView.width;
        self.titleLabel.y = 0;
    }else {
    
        self.imageView.width = self.width;
        self.imageView.height = self.imageView.width;
        self.imageView.x = 0;
        self.imageView.y = 0;

        self.titleLabel.hidden = YES;
        
    }
}

@end
