//
//  SYConst.h
//  ipad项目－QQ屏幕适配
//
//  Created by 申颖 on 16/1/2.
//  Copyright © 2016年 Ying. All rights reserved.
//

//#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

// .h中声明常量
//extern 外界的类可以引用
//const 指定了后面的值是不能改变的

//最小宽度
extern const CGFloat SYDockMinWidth;
//最大宽度
extern const CGFloat SYDockMaxWidth;
//屏幕的最小宽度
extern const CGFloat SYScreenMinWidth768;
//屏幕的最大宽度
extern const CGFloat SYScreenMaxWidth1024;
//选中索引的通知名称
extern NSString *const SYTabBarButtonChangeNotification;
//选中索引的key
extern const NSString * SYTabBarSelectIndex;
//dockView背景颜色值
extern const CGFloat dockviewBgColor55;
//定义横屏
#define  SYLandscape ([UIScreen mainScreen].bounds.size.width == SYScreenMaxWidth1024)

/** NSLog 输出宏*/
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif

//@interface SYConst : NSObject
//
//@end
