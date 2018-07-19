//
//  RBPushAnimation.m
//  PushAnimate
//
//  Created by 任斌 on 2018/7/18.
//  Copyright © 2018年 RB. All rights reserved.
//

#import "RBPushAnimation.h"
#import <UIKit/UIKit.h>
@interface RBPushAnimation()<UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) id<UIViewControllerContextTransitioning> transContext  ;

@end


@implementation RBPushAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

@end
