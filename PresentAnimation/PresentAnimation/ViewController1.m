
//
//  ViewController1.m
//  PresentAnimation
//
//  Created by 任斌 on 2018/7/11.
//  Copyright © 2018年 RB. All rights reserved.
//

#import "ViewController1.h"
#import "ViewController2.h"
@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(50, 50, 50, 50);
    [self.view addSubview:btn];
    
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchesed)];
    [self.view addGestureRecognizer:tapG];
}

- (void)jump {
    [self presentViewController:ViewController2.new animated:YES completion:nil];
}



- (void)touchesed {
    NSLog(@"vc1被点击");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@"VC被销毁了");
}
@end
