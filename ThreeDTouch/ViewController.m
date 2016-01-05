//
//  ViewController.m
//  ThreeDTouch
//
//  Created by mark on 16/1/5.
//  Copyright © 2016年 mark. All rights reserved.
//

#import "ViewController.h"
#import "PreviewController.h"
//3DTouch 只在iOS9之后有用
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

@interface ViewController ()<UIViewControllerPreviewingDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //首先要判断一下 压力感是否有效，跟着注册delegate
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        [self registerForPreviewingWithDelegate:self sourceView:self.view];
        NSLog(@"3D Touch  可用!");
    }
    else
    {
        NSLog(@"3D Touch 无效");
    }

}

#pragma mark -UIViewControllerPreviewingDelegate
// 传入预览的VC
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)context viewControllerForLocation:(CGPoint) point
{
    //1.相当于modeld出来 self.presentedViewController指的是展示的vc
    // if ([self.presentedViewController isKindOfClass:[PreviewController class]])

    //2.创建预览的view
    PreviewController *preVC = [[PreviewController alloc] init];
    preVC.view.backgroundColor = [UIColor redColor];
    preVC.preferredContentSize = CGSizeMake(100,300);
    
    //
    CGRect rect = CGRectMake(10, point.y - 10, self.view.frame.size.width - 20, 20);
    context.sourceRect = rect;
    return preVC;
}

//这个方法是在什么时候出发呢？就是 给更加大的力度的时候进去 全屏状态 
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    [self showViewController:viewControllerToCommit sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
