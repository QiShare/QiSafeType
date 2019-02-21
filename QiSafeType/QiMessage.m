//
//  QiMessage.m
//  QiSafeType
//
//  Created by wangyongwang on 2019/2/20.
//  Copyright © 2019年 QiShare. All rights reserved.
//
// https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html#//apple_ref/doc/uid/TP40008048-CH100-SW1

#import "QiMessage.h"
#import <objc/runtime.h>

static NSArray *respondClasses;

@implementation QiMessage

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    printf("%s:%s \n", __func__ ,NSStringFromSelector(sel).UTF8String);
    return [super resolveInstanceMethod:sel];
    /** 动态添加方法
     if (sel == @selector(addObject:)) {
         BOOL addSuc = class_addMethod([self class], sel, (IMP)(addObject), "v@:");
         if (addSuc) {
             return addSuc;
         }
     } else if (sel == @selector(length)) {
         BOOL addSuc = class_addMethod([self class], sel, (IMP)(length), "q@:");
         if (addSuc) {
                return addSuc;
         }
     }
     */
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    printf("%s:%s \n", __func__ ,NSStringFromSelector(aSelector).UTF8String);
    
    id forwardTarget = [super forwardingTargetForSelector:aSelector];
    return forwardTarget;
    
    /** forwardTarget部分处理的方式
    if (forwardTarget) {
        return forwardTarget;
    }
    
    Class someClass = [self qiResponedClassForSelector:aSelector];
    if (someClass) {
        forwardTarget = [someClass new];
    }
    
    return forwardTarget;
     */
}


- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    printf("%s:%s \n\n\n\n", __func__ ,NSStringFromSelector(anInvocation.selector).UTF8String);
    // NSLog会对输出内容有副影响
    // NSLog(@"方法：%s--Class：%@响应方法：%@", __FUNCTION__, self, NSStringFromSelector(anInvocation.selector));
    anInvocation.target = nil;
    [anInvocation invoke];
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
    
    NSMethodSignature *signature = [super methodSignatureForSelector:selector];
    if (!signature) {
        Class responededClass = [self qiResponedClassForSelector:selector];
        if (responededClass) {
            @try {
                signature = [responededClass instanceMethodSignatureForSelector:selector];
            } @catch (NSException *exception) {
                
            }@finally {
                
            }
        }
    }
    return signature;
}

- (Class)qiResponedClassForSelector:(SEL)selector {
    
    respondClasses = @[
                       [NSMutableArray class],
                       [NSMutableDictionary class],
                       [NSMutableString class],
                       [NSNumber class],
                       [NSDate class],
                       [NSData class]
                       ];
    for (Class someClass in respondClasses) {
        if ([someClass instancesRespondToSelector:selector]) {
            return someClass;
        }
    }
    return nil;
}


void addObject(id self, SEL _cmd) {
    
}

unsigned long length(id self, SEL _cmd) {
 
    return 0;
}
 

@end
