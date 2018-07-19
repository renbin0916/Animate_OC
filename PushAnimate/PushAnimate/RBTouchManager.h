//
//  RBTouchManager.h
//  PushAnimate
//
//  Created by 任斌 on 2018/7/18.
//  Copyright © 2018年 RB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface RBTouchManager : NSObject

@property (nonatomic, assign) CGPoint touchPoint;

@property (nonatomic, assign) CGRect fromFrame;

@property (nonatomic, assign) CGRect toFrame;

+ (instancetype)rb_shareManager;
@end
