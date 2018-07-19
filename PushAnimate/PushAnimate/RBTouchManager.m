//
//  RBTouchManager.m
//  PushAnimate
//
//  Created by 任斌 on 2018/7/18.
//  Copyright © 2018年 RB. All rights reserved.
//

#import "RBTouchManager.h"

@interface RBTouchManager() {
    CGRect _fromFrame;
    CGRect _toFrame;
}

@property (nonatomic, strong) NSMutableArray *fromArray;

@property (nonatomic, strong) NSMutableArray *toArray;

@end


@implementation RBTouchManager

+ (instancetype)rb_shareManager {
    static RBTouchManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[RBTouchManager alloc] init];
        manager.touchPoint = CGPointZero;
    });
    return manager;
}

- (void)setTouchPoint:(CGPoint)touchPoint {
    _touchPoint = touchPoint;
}

- (void)setFromFrame:(CGRect)fromFrame {
    _fromFrame = fromFrame;
    [self.fromArray addObject:NSStringFromCGRect(fromFrame)];
}

- (CGRect)fromFrame {
    NSString *rectString = self.fromArray.lastObject;
    return  CGRectFromString(rectString);
}

- (void)setToFrame:(CGRect)toFrame {
    _toFrame = toFrame;
    [self.toArray addObject:NSStringFromCGRect(toFrame)];
}

- (CGRect)toFrame {
    NSString *rectString = self.toArray.lastObject;
    return CGRectFromString(rectString);
}

- (NSMutableArray *)fromArray {
    if (!_fromArray) {
        _fromArray = [NSMutableArray new];
    }
    return _fromArray;
}

- (NSMutableArray *)toArray {
    if (!_toArray) {
        _toArray = [NSMutableArray new];
    }
    return _toArray;
}
@end
