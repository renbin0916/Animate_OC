//
//  PresentAnimate.h
//  PresentAnimation
//
//  Created by 任斌 on 2018/7/11.
//  Copyright © 2018年 RB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PresentAnimateType) {
    PresentAnimateTypeShow,
    PresentAnimateTypeDismiss
};

@interface PresentAnimate : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)createPresentType:(PresentAnimateType)type;

- (instancetype)initWithPresentAnimateType:(PresentAnimateType)type;

@end
