//
//  NSDictionary+QiSafeType.m
//  QiSafeType
//
//  Created by wangyongwang on 2019/2/25.
//  Copyright © 2019年 QiShare. All rights reserved.
//

#import "NSDictionary+QiSafeType.h"
#import <objc/runtime.h>


@implementation NSDictionary (QiSafeType)

+ (void)swapMethod {
    
    Class class = [self class];
    SEL originSel = @selector(dictionaryWithObjects:forKeys:count:);
    SEL alterSel = @selector(qiSafeDictionaryWithObjects:forKeys:count:);
    
    Method originMethod = class_getClassMethod(class, originSel);
    Method alterMethod = class_getClassMethod(class, alterSel);
    method_exchangeImplementations(originMethod, alterMethod);
    
    /*
    Class __NSDictionary0Class = NSClassFromString(@"__NSDictionary0");
    Class __NSSingleEntryDictionaryIClass = NSClassFromString(@"__NSSingleEntryDictionaryI");
    Class __NSDictionaryIClass = NSClassFromString(@"__NSDictionaryI");
    Class __NSPlaceholderDictionaryClass = NSClassFromString(@"__NSPlaceholderDictionary");
    class = __NSPlaceholderDictionaryClass;
     */
//    Method oriInitMethod = class_getInstanceMethod(__NSPlaceholderDictionaryClass, @selector(initWithObjects:forKeys:count:));
//    Method tarInitMethod = class_getInstanceMethod(__NSPlaceholderDictionaryClass, @selector(qiSafeInitWithObjects:forKeys:count:));
//    method_exchangeImplementations(oriInitMethod, tarInitMethod);
    
    // class = NSClassFromString(@"__NSPlaceholderDictionary");
    // dict0：__NSDictionary0
    // dict1：__NSSingleEntryDictionaryI
    // dict2：__NSDictionaryI
    // dict3：__NSDictionaryI
    /**
    Method originMethod = class_getInstanceMethod(class, @selector(dictionaryWithObjects:forKeys:count:));
    originMethod = class_getInstanceMethod(__NSDictionary0Class, @selector(dictionaryWithObjects:forKeys:count:));
    originMethod = class_getInstanceMethod(__NSSingleEntryDictionaryIClass, @selector(dictionaryWithObjects:forKeys:count:));
    originMethod = class_getInstanceMethod(__NSDictionaryIClass, @selector(dictionaryWithObjects:forKeys:count:));
    
    originMethod = class_getClassMethod(__NSDictionary0Class, srcSel);
    originMethod = class_getClassMethod(__NSSingleEntryDictionaryIClass, srcSel);
    originMethod = class_getClassMethod(__NSDictionaryIClass, srcSel);
    // 上述几个方法地址相同originMethod = 0x000000010ffc1608
     */
}

+ (id)qiSafeDictionaryWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt{
    
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i ++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key || !obj) {
            continue;
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j ++;
    }
    
    return [self qiSafeDictionaryWithObjects:safeObjects forKeys:safeKeys count:j];
}

- (instancetype)qiSafeInitWithObjects:(const id [])objects forKeys:(const id <NSCopying> [])keys count:(NSUInteger)cnt {
    
    id safeObjs[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i ++) {
        if (!objects[i] || !keys[i]) {
            continue;
        }
        safeObjs[j++] = objects[i];
        safeKeys[j++] = keys[i];
    }
    return [self qiSafeInitWithObjects:safeObjs forKeys:safeKeys count:j];
}

+ (void)load {
    
    [self swapMethod];
}

@end

NS_ASSUME_NONNULL_BEGIN

@implementation NSMutableDictionary (QiSafeType)

+ (void)load {
    
    [self swapMethod];
}

+ (void)swapMethod {
    
    Class class = NSClassFromString(@"__NSDictionaryM");
    Method originMethod = class_getInstanceMethod(class, @selector(setObject:forKey:));
    Method alterMethod = class_getInstanceMethod(class, @selector(qiSafeSetObject:forKey:));
    method_exchangeImplementations(originMethod, alterMethod);
    
    Method originKeyedSubscriptMethod = class_getInstanceMethod(class, @selector(setObject:forKeyedSubscript:));
    Method alterKeyedSubscriptMethod = class_getInstanceMethod(class, @selector(qiSafeSetObject:forKeyedSubscript:));
    method_exchangeImplementations(originKeyedSubscriptMethod, alterKeyedSubscriptMethod);
}

- (void)qiSafeSetObject:(id)anObject forKey:(id <NSCopying>)aKey {
    
    if (!aKey || !anObject) {
        return;
    }
    [self qiSafeSetObject:anObject forKey:aKey];
}

- (void)qiSafeSetObject:(id)obj forKeyedSubscript:(id <NSCopying>)key {
    
    if (!key || !obj) {
        return;
    }
    [self qiSafeSetObject:obj forKeyedSubscript:key];
}

@end

NS_ASSUME_NONNULL_END
