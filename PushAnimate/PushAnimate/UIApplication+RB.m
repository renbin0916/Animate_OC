//
//  UIApplication+RB.m
//  PushAnimate
//
//  Created by 任斌 on 2018/7/18.
//  Copyright © 2018年 RB. All rights reserved.
//

#import "UIApplication+RB.h"
#import <objc/runtime.h>
#import "RBTouchManager.h"

@implementation UIApplication (RB)

+ (void)load {
    Method originMethod = class_getInstanceMethod(NSClassFromString(@"UIApplication"), @selector(sendEvent:));
    Method myMethod    = class_getInstanceMethod(NSClassFromString(@"UIApplication"), @selector(rb_SendEvent:));
    method_exchangeImplementations(originMethod, myMethod);
}

- (void)rb_SendEvent:(UIEvent *)event {
    UITouch *touch = [event touchesForWindow:[UIApplication sharedApplication].keyWindow].anyObject;
    CGPoint tempPoint = [touch locationInView:[UIApplication sharedApplication].keyWindow];
    [RBTouchManager rb_shareManager].touchPoint = tempPoint;
    [self rb_SendEvent:event];
}

@end
