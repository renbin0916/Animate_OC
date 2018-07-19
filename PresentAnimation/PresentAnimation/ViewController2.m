//
//  ViewController2.m
//  PresentAnimation
//
//  Created by 任斌 on 2018/7/11.
//  Copyright © 2018年 RB. All rights reserved.
//

#import "ViewController2.h"
#import "PresentAnimate.h"
#import "ViewController1.h"
@interface ViewController2 ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController2

- (instancetype)init {
    if (self = [super init]) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, self.view.frame.size.height - 300)];
    [self.view addSubview:tempView];
    tempView.backgroundColor = [UIColor yellowColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(taped2)];
    [self.view addGestureRecognizer:tap];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeInfoDark];
    btn.center = self.view.center;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(taped) forControlEvents:UIControlEventTouchUpInside];
}

- (void)taped {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)taped2 {
    NSLog(@"vc2被点击");
    [self presentViewController:ViewController1.new animated:YES completion:nil];
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [PresentAnimate createPresentType:PresentAnimateTypeShow];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [PresentAnimate createPresentType:PresentAnimateTypeDismiss];
}

- (void)dealloc {
    NSLog(@"v2销毁");
}
@end
