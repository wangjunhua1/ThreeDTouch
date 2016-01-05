
//
//  PreviewController.m
//  ThreeDTouch
//
//  Created by mark on 16/1/5.
//  Copyright © 2016年 mark. All rights reserved.
//

#import "PreviewController.h"

@interface PreviewController ()

@end
@implementation PreviewController

- (void)viewDidLoad{
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissMe)];
    [self.view addGestureRecognizer:tap];
}

- (void)dismissMe{
    // dismiss this view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    // setup a list of preview actions
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"这里可以做你想要做的事情的Aciton" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"click");
    }];
    
    // add them to an arrary
    //想要显示多个就定义多个 UIPreviewAction
    NSArray *actions = @[action1];
    // and return them (return the array of actions instead to see all items ungrouped)
    return actions;
}


@end
