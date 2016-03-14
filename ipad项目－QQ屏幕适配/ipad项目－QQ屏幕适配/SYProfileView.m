//
//  SYProfileView.m
//  ipad项目－QQ屏幕适配
//
//  Created by 申颖 on 16/1/2.
//  Copyright © 2016年 Ying. All rights reserved.
//

#import "SYProfileView.h"

@implementation SYProfileView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //1. 设置头像
        [self setImage:[UIImage imageNamed:@"myProfile"] forState:UIControlStateNormal];
        
        //2. 设置文字
        [self setTitle:@"偶像赵薇" forState:UIControlStateNormal];
        
        //3. 头像圆角效果
        self.imageView.layer.cornerRadius = 35;
        self.imageView.clipsToBounds = YES;
        
        //4. 文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return self;
}

//self --> ProfileView
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.width = self.width;
    self.imageView.height = self.width;
    self.imageView.x = 0;
    self.imageView.y = 0;
    
    //需要调整label和image的位置
    if (SYLandscape) {
        //横屏
        self.titleLabel.hidden = NO;
        self.titleLabel.width = self.width;
        self.titleLabel.height = self.height - self.width;
        self.titleLabel.x = 0;
        self.titleLabel.y = self.imageView.height;
    } else {
        self.titleLabel.hidden = YES;
    }
}

@end
