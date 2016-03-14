//
//  SYTabBarView.m
//  ipad项目－QQ屏幕适配
//
//  Created by 申颖 on 16/1/2.
//  Copyright © 2016年 Ying. All rights reserved.
//

#import "SYTabBarView.h"
#import "SYTabBarButton.h"

@interface SYTabBarView()
//当前选中的按钮属性
@property (nonatomic,strong)SYTabBarButton *selectBtn;
@end

@implementation SYTabBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    NSLog(@"[UIScreen mainScreen].scale=%f",[UIScreen mainScreen].scale);
    if (self) {
        
        // 创建六个按钮
        SYTabBarButton *firstBtn=[self setupButtonWithImageName:@"tab_bar_feed_icon" title:@"全部动态"];
        //按钮失效
        firstBtn.enabled = NO;
        //给属性按钮赋值  默认选中第一个按钮
        self.selectBtn = firstBtn;
        
        [self setupButtonWithImageName:@"tab_bar_passive_feed_icon" title:@"与我相关"];
        [self setupButtonWithImageName:@"tab_bar_pic_wall_icon" title:@"照片墙"];
        [self setupButtonWithImageName:@"tab_bar_e_album_icon" title:@"电子相框"];
        [self setupButtonWithImageName:@"tab_bar_friend_icon" title:@"好友"];
        [self setupButtonWithImageName:@"tab_bar_e_more_icon" title:@"设置"];
    }
    return self;
}

#pragma mark 公用的创建按钮的方法
- (SYTabBarButton *)setupButtonWithImageName:(NSString *)imageName title:(NSString *)title
{
    SYTabBarButton *button = [SYTabBarButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    //建议在此处设置tag值，这里只会调用一次
    button.tag = self.subviews.count;
    
    //绑定按钮方法
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:button];
    
    return button;
}

//按钮点击方法
-(void)buttonClick:(SYTabBarButton *)btn{

    //让之前选中的按钮恢复可用状态
    self.selectBtn.enabled = YES;
    //让当前选中按钮变成不可用状态
    btn.enabled = NO;
    //让当前按钮赋值给属性
    self.selectBtn = btn;
    //发送通知
    [[NSNotificationCenter defaultCenter]postNotificationName:SYTabBarButtonChangeNotification object:nil userInfo:@{SYTabBarSelectIndex:@(btn.tag)}];
}

//self --> TabBarView
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    
    NSLog(@"SYTabBarView是，即self＝%@",self);
    NSLog(@"SYTabBarView的子类是，即self.subviews＝%@",self.subviews);
    
    for (int i = 0; i < count; i++) {
        
        //取出SYTabBarView的子类赋给button
        SYTabBarButton *button = self.subviews[i];
        
        button.width = self.width;
        button.height = SYDockMinWidth;
        button.x = 0;
        button.y = i * button.height;
        
        //绑定tag, 以便传值 --> 每次布局都会重复调用
        //        button.tag = i;
    }
}

@end
