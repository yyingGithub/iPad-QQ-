//
//  SYMainViewController.m
//  ipad项目－QQ屏幕适配
//
//  Created by 申颖 on 16/1/2.
//  Copyright © 2016年 Ying. All rights reserved.
//

#import "SYMainViewController.h"
#import "SYDockView.h"

@interface SYMainViewController ()

//添加测栏
@property (nonatomic,strong)SYDockView *dockView;

@property (nonatomic,strong)UIViewController *selectVC;
@end

@implementation SYMainViewController

//懒加载
- (SYDockView *)dockView
{
    if (_dockView == nil) {
        // 创建DockView
        SYDockView *dockView = [SYDockView new];
        [self.view addSubview:dockView];
        _dockView = dockView;
    }
    return _dockView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //监听通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tabBarButtonChangeNotification:) name:SYTabBarButtonChangeNotification object:nil];
    
    //创建控制器
    [self setupViewControllers];
    
    //创建dockView
//    SYDockView *dockView=[[SYDockView alloc]init];
//    [self.view addSubview: dockView];
//    self.dockView=dockView;
    
    self.view.backgroundColor = [UIColor whiteColor];
    //ios8之后的写法
    [self viewWillTransitionToSize:[UIScreen mainScreen].bounds.size withTransitionCoordinator:self.transitionCoordinator];
    
}

//通知的方法
-(void)tabBarButtonChangeNotification:(NSNotification *)notification{

    //获取通知的值
    NSInteger index = [notification.userInfo[SYTabBarSelectIndex]integerValue];
    
    //切换控制器
    [self changeViewController:index];
}
//dealloc，用来移除通知
-(void)dealloc{

    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

//创建控制器
-(void)setupViewControllers{

    //创建子控制器
    for (int i=0; i<6; i++) {
        UIViewController *viewVC = [[UIViewController alloc]init];
        viewVC.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
        viewVC.view.frame = CGRectMake(210, 0, 500, 700);
        [self addChildViewController:viewVC];
    }
    //直接显示第一控制器
    [self changeViewController:0];
    
}

-(void)changeViewController:(NSInteger)index{

    NSLog(@"切换控制器");
    //通过切换索引来切换控制器
    //先移除旧的视图
    [self.selectVC.view removeFromSuperview];
    
    //获取新的
    UIViewController *newVC = self.childViewControllers[index];
    
    //属性更换成新的视图
    self.selectVC = newVC;
    
    //添加新的view到主视图
    [self.view addSubview:newVC.view];
    
    //设置约束
    [newVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self.view);
        make.left.equalTo(self.dockView.mas_right);
    }];
}
//视图发生大小改变时会调用此方法  iOS8以后的方法，在实现了它后，旧版方法会覆盖
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{

    NSLog(@"size: %@", NSStringFromCGSize(size));
    
    //方法一：
    if (size.width == SYScreenMaxWidth1024) {
        NSLog(@"横屏");
        self.dockView.width = SYDockMaxWidth;
        self.dockView.height = SYScreenMinWidth768;
    }else {
    
        NSLog(@"竖屏");
        self.dockView.width = SYDockMinWidth;
        self.dockView.height = SYScreenMaxWidth1024;
    }
    
    //方法二
    //    if (size.width > size.height) {
    //        NSLog(@"横屏");
    //    }
    
    //方法三 orientation: 方向
    //    if ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft || [UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeRight) {
    //        NSLog(@"横屏");
    //    }

}

//ios8之前的方法
//将要旋转到某个方向时会调用此方法
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    //Landscape : 横屏  Portrait: 竖屏
    
    // 传入一个方向值, 如果是横屏, 则返回YES
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
        NSLog(@"横屏");
    }
    
    // 传入一个方向值, 如果是竖屏, 则返回YES
    if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
        NSLog(@"竖屏");
    }
    
}

@end
