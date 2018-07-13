//
//  PresentAnimate.m
//  PresentAnimation
//
//  Created by 任斌 on 2018/7/11.
//  Copyright © 2018年 RB. All rights reserved.
//

#import "PresentAnimate.h"

@interface PresentAnimate()

@property (nonatomic, assign) PresentAnimateType type;

@end

@implementation PresentAnimate

+ (instancetype)createPresentType:(PresentAnimateType)type {
    return [[self alloc] initWithPresentAnimateType:type];
}

- (instancetype)initWithPresentAnimateType:(PresentAnimateType)type {
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (_type == PresentAnimateTypeShow) {
        [self presentAnimate:transitionContext];
    } else {
        [self dismissAnimate:transitionContext];
    }
}

- (void)presentAnimate:(id<UIViewControllerContextTransitioning>)transitionContext  {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = fromVC.view;
    UIView *toView   = toVC.view;
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:fromView];
    [containerView addSubview:toView];
    toView.frame = CGRectMake(0, toView.frame.size.height, toView.frame.size.width, toView.frame.size.height);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.frame = CGRectMake(0, 0, toView.frame.size.width, toView.frame.size.height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
        [[UIApplication sharedApplication].keyWindow insertSubview:fromView atIndex:0];
    }];
}

- (void)dismissAnimate:(id<UIViewControllerContextTransitioning>)transitionContext {
    __block UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = fromVC.view;
    
    if (fromVC.isBeingDismissed) {
        [UIView animateWithDuration:0.25 animations:^{
            fromView.frame = CGRectMake(0, fromView.frame.size.height, fromView.frame.size.width, fromView.frame.size.height);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:finished];
        }];
    }
    
}

@end
