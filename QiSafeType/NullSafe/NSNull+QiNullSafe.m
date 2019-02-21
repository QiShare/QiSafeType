//
//  NSNull+QiNullSafe.m
//  QiSafeType
//
//  Created by wangyongwang on 2019/2/21.
//  Copyright © 2019年 QiShare. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSArray *respondClasses;

@implementation NSNull (QiNullSafe)

//#if NO

- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    printf("%s:%s \n", __func__ ,NSStringFromSelector(aSelector).UTF8String);
    
    id forwardTarget = [super forwardingTargetForSelector:aSelector];
    if (forwardTarget) {
        return forwardTarget;
        
    }
    Class someClass = [self qiResponedClassForSelector:aSelector];
    if (someClass) {
        forwardTarget = [someClass new];
        
    }
    return forwardTarget;
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

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

}

- (id)valueForUndefinedKey:(NSString *)key {

    return nil;
}

//#endif

@end
