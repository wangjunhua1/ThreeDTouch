//
//  AppDelegate.m
//  ThreeDTouch
//
//  Created by mark on 16/1/5.
//  Copyright © 2016年 mark. All rights reserved.
//http://blog.csdn.net/liwenjie0912/article/details/49178873
// iOS 3D Touch (UIApplicationShortcutItem、UIViewControllerPreviewing、UIPreviewAction)

//首先 有几个要知道的手势
//第一， 在点击app icon 的手长按 并且用力一点（用点力不然没效果，不会弄坏手机，坏了也不是我的，哈哈！） 就会出现 几个Item。
//
//第二，（1）在app 里面 长按 也要用力往下压 跟着就会可以弹出 自定义的 ViewController。这个时候如果你放手了那么就会消失。
//
//（2）如果  长按 往下压 弹出了自定义的ViewController 之后跟着网上移动，就可以出现 选择Action。
//
//第三，如果 长按 往下压 弹出了自定义的ViewController，然后更加 用力一点 比 弹出的ViewController的力度 更加大一点 那么  自定义的这个ViewController 就会 相当于model 进来了。

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //第一 在点击app icon 的手长按
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"login_account_icon"];
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"login_pwd_icon"];
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"login_check_icon"];
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc] initWithType:@"item1" localizedTitle:@"账号" localizedSubtitle:@"点击账号" icon:icon1 userInfo:nil];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:@"item2" localizedTitle:@"密码" localizedSubtitle:@"点击密码" icon:icon2 userInfo:nil];
    UIApplicationShortcutItem *item3 = [[UIApplicationShortcutItem alloc] initWithType:@"item3" localizedTitle:@"验证码" localizedSubtitle:@"点击验证码" icon:icon3 userInfo:nil];
    application.shortcutItems = @[item1,item2,item3];
    
    return YES;
}

// 3DTouch Function Call Back
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    if ([shortcutItem.type isEqualToString:@"item1"]) {
        NSLog(@"点击账号");
    }
    else if ([shortcutItem.type isEqualToString:@"item2"]){
        NSLog(@"点击密码");
    }
    else{
        NSLog(@"点击验证码");
    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
