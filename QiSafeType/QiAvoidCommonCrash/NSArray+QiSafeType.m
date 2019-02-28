//
//  NSArray+QiSafeType.m
//  QiSafeType
//
//  Created by wangyongwang on 2019/2/26.
//  Copyright © 2019年 QiShare. All rights reserved.
//
// 参考学习网址：https://github.com/chenfanfang/AvoidCrash
// https://github.com/JJMM/SafeKit

#import "NSArray+QiSafeType.h"
#import <objc/runtime.h>


@implementation NSArray (QiSafeType)

+ (instancetype)qisafeArrayWithObjects:(const id _Nonnull [_Nonnull])objects count:(NSUInteger)cnt {
    
    id instance = nil;
    id safeObjs[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i ++) {
        if (!objects[i]) {
            continue;
        }
        safeObjs[j++] = objects[i];
    }
    instance = [self qisafeArrayWithObjects:safeObjs count:j];
    return instance;
}

- (id)qiSafeArr0ObjectAtIndex:(NSUInteger)index {
    
    if (index >= [self count]) {
        return nil;
    }
    return [self qiSafeArr0ObjectAtIndex:index];
}

- (id)qiSafeArrIObjAtIndexedSubscript:(NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    return [self qiSafeArrIObjAtIndexedSubscript:index];
}

- (id)qiSafeSingleObjArrIObjectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    return [self qiSafeSingleObjArrIObjectAtIndex:index];
}

+ (void)load {
    
    Method originMethod = class_getClassMethod([NSArray class], @selector(arrayWithObjects:count:));
    Method alterMethod = class_getClassMethod([NSArray class], @selector(qisafeArrayWithObjects:count:));
    method_exchangeImplementations(originMethod, alterMethod);
    
    // __NSArray0
    Method originArr0ObjectAtIndexMethod = class_getInstanceMethod(NSClassFromString(@"__NSArray0"), @selector(objectAtIndex:));
    Method alterArr0ObjectAtIndexMethod = class_getInstanceMethod(NSClassFromString(@"__NSArray0"), @selector(qiSafeArr0ObjectAtIndex:));
    method_exchangeImplementations(originArr0ObjectAtIndexMethod, alterArr0ObjectAtIndexMethod);
    
    // __NSSingleObjectArrayI
    Method originSingleObjArrIObjectAtIndexMethod = class_getInstanceMethod(NSClassFromString(@"__NSSingleObjectArrayI"), @selector(objectAtIndex:));
    Method alterSingleObjArrIObjectAtIndexMethod = class_getInstanceMethod(NSClassFromString(@"__NSSingleObjectArrayI"), @selector(qiSafeSingleObjArrIObjectAtIndex:));
    method_exchangeImplementations(originSingleObjArrIObjectAtIndexMethod, alterSingleObjArrIObjectAtIndexMethod);
    
    // __NSArrayI
    Method originArrIObjAtIndexedSubMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndexedSubscript:));
    Method alterArrIObjAtIndexedSubMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(qiSafeArrIObjAtIndexedSubscript:));
    method_exchangeImplementations(originArrIObjAtIndexedSubMethod, alterArrIObjAtIndexedSubMethod);
}

@end


NS_ASSUME_NONNULL_BEGIN

@implementation NSMutableArray (QiSafeType)

- (void)qiSafeInsertObject:(id)obj atIndex:(NSUInteger)index {
    
    if (!obj) {
        return;
    }
    [self qiSafeInsertObject:obj atIndex:index];
}

- (id)qiSafeArrMObjAtIndexedSubscript:(NSUInteger)index {
    
    if (index >= self.count) {
        return nil;
    }
    return [self qiSafeArrMObjAtIndexedSubscript:index];
}

+ (void)load {
        
    Class __NSArrayMClass = NSClassFromString(@"__NSArrayM");
    
    Method originInsertObjAtIndexMethod = class_getInstanceMethod(__NSArrayMClass, @selector(insertObject:atIndex:));
    Method alterInsertObjAtIndexMethod = class_getInstanceMethod(__NSArrayMClass, @selector(qiSafeInsertObject:atIndex:));
    method_exchangeImplementations(originInsertObjAtIndexMethod, alterInsertObjAtIndexMethod);

    Method originObjAtIndexedSubMethod = class_getInstanceMethod(__NSArrayMClass, @selector(objectAtIndexedSubscript:));
    Method alterObjAtIndexedSubMethod = class_getInstanceMethod(__NSArrayMClass, @selector(qiSafeArrMObjAtIndexedSubscript:));
    method_exchangeImplementations(originObjAtIndexedSubMethod, alterObjAtIndexedSubMethod);
    
    /**
     Method method1 = class_getInstanceMethod(__NSArrayMClass, originSel);
     method1 = class_getInstanceMethod([[NSMutableArray array] class], originSel);
     Printing description of method1:
     (Method) method1 = 0x00000001050870d8
     Printing description of method1:
     (Method) method1 = 0x00000001050870d8
     */
}

@end

NS_ASSUME_NONNULL_END
