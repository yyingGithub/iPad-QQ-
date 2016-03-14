//
//  SYDockView.m
//  ipad项目－QQ屏幕适配
//
//  Created by 申颖 on 16/1/2.
//  Copyright © 2016年 Ying. All rights reserved.
//

#import "SYDockView.h"
#import "SYTabBarView.h"
#import "SYToolBarView.h"
#import "SYProfileView.h"

@interface SYDockView()

/** 头像*/
@property (nonatomic, strong) SYProfileView *profileView;

/** 标签栏*/
@property (nonatomic, strong) SYTabBarView *tabBarView;

/** 工具栏*/
@property (nonatomic, strong) SYToolBarView *toolBarView;

@end

@implementation SYDockView

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:55/255.0 green:55/255.0 blue:55/255.0 alpha:1];
        
        //1. 创建头像
        SYProfileView *profileView = [SYProfileView new];
        [self addSubview:profileView];
        self.profileView = profileView;
        
        //2. 创建标签栏
        SYTabBarView *tabBarView = [SYTabBarView new];
        [self addSubview:tabBarView];
        self.tabBarView = tabBarView;
        
        //3. 创建工具栏
        SYToolBarView *toolBarView = [SYToolBarView new];
        [self addSubview:toolBarView];
        self.toolBarView = toolBarView;

    }
    return self;
}

//如果不是控制器, 我们没有(view旋转的)方法可以调用, 只能调用layoutSubviews
-(void)layoutSubviews{

    [super layoutSubviews];
    //工具栏
    self.toolBarView.width = self.width;
    if (SYLandscape) {
        self.toolBarView.height = self.width/3;
    }else{
        self.toolBarView.height = self.width * 3;
    }
    self.toolBarView.y = self.height - self.toolBarView.height;

    //标签类
    self.tabBarView.width = self.width;
    self.tabBarView.height = SYDockMinWidth * 6;
    self.tabBarView.y = self.toolBarView.y - self.tabBarView.height;
    
    //头像
    if (SYLandscape) {
        self.profileView.width = self.width * 0.4;
        self.profileView.height = self.profileView.width + 30;
        self.profileView.x = (self.width-self.profileView.width) * 0.5;
        self.profileView.y = 100;
        
    }else{
    
        self.profileView.width = self.width * 0.8;
        self.profileView.height = self.profileView.width;
        self.profileView.x = (self.width - self.profileView.width) * 0.5;
        self.profileView.y = 180;
    }
}
@end
