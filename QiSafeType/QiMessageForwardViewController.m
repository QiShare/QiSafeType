//
//  QiMessageForwardViewController.m
//  QiSafeType
//
//  Created by wangyongwang on 2019/2/20.
//  Copyright © 2019年 QiShare. All rights reserved.
//

#import "QiMessageForwardViewController.h"
#import "QiMessage.h"

@implementation QiMessageForwardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"消息转发";
    
    UIButton *forwardMessageButton = [[UIButton alloc] initWithFrame:CGRectMake(.0, .0, CGRectGetWidth(self.view.frame), 40.0)];
    forwardMessageButton.backgroundColor = [UIColor blueColor];
    forwardMessageButton.center = self.view.center;
    [forwardMessageButton setTitle:@"触发消息转发" forState:UIControlStateNormal];
    [self.view addSubview:forwardMessageButton];
    [forwardMessageButton addTarget:self action:@selector(forwardMessageButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    /*
     NSNull *null = [NSNull null];
     [null performSelector:@selector(addObject:) withObject:@"QiShare"];
     [null performSelector:@selector(setValue:forKey:) withObject:@"QiShare"];
     [null performSelector:@selector(valueForKey:) withObject:@"QiShare"];
     [null performSelector:@selector(length) withObject:nil];
     [null performSelector:@selector(integerValue) withObject:nil];
     [null performSelector:@selector(timeIntervalSinceNow) withObject:nil];
     [null performSelector:@selector(bytes) withObject:nil];
     */
}

- (void)forwardMessageButtonClicked:(UIButton *)sender {
    
    QiMessage *qiMessage = [QiMessage new];
    [qiMessage performSelector:@selector(length)];
}

@end
























