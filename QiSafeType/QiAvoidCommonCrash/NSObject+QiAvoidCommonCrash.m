//
//  NSObject+QiAvoidCommonCrash.m
//  QiAvoidCommonCrash
//
//  Created by wangyongwang on 2019/2/12.
//

#import "NSObject+QiAvoidCommonCrash.h"

//! 服务端返回数值类型有误
static NSInteger const kCustomErrorCode = 1000;

#if DEBUG

@implementation NSObject (QiAvoidCommonCrash)


- (NSInteger)qi_safeIntegerValue {
    
    if ([self isKindOfClass:[NSNumber class]]) {
        return [((NSNumber *)self) integerValue];
    } else if([self isKindOfClass:[NSString class]]) {
        return [((NSString *)self) integerValue];
    } else {
        return kCustomErrorCode;
    }
}

- (id)qi_safeArrayObjectAtIndex:(NSUInteger)index {
    
    if (![self isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    if (index < 0 || index >= ((NSArray *)self).count) {
        return nil;
    }
    
    return [(NSArray *)self objectAtIndex:index];
}

- (void)qi_safeMutableArrayAddObject:(id)obj {
    
    if (!obj) {
        return;
    }
    if (![self isKindOfClass:[NSMutableArray class]]) {
        return;
    }
    [(NSMutableArray *)self addObject:obj];
}

- (id)qi_safeDictionaryValueForkey:(NSString *)key {
    
    if (![self isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    if (![key isKindOfClass:[NSString class]]) {
        return nil;
    }
    return [(NSDictionary *)self valueForKey:key];
}

- (void)qi_safeAddObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context {
    
    if (!observer || ![keyPath isKindOfClass:[NSString class]] || !keyPath) {
        return ;
    }
    [self addObserver:observer forKeyPath:keyPath options:options context:context];
}

- (void)qi_safeRemoveObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath {
    
    if (!observer || ![keyPath isKindOfClass:[NSString class]] || !keyPath) {
        return ;
    }
    [self removeObserver:observer forKeyPath:keyPath];
}

@end


@implementation NSString (QiAvoidCommonCrash)

+ (NSString *)qi_safeNilStringSourceString:(NSString *)sourceStr DestinationDefaultString:(NSString *)destinationDefaultStr {
    
    if (!sourceStr) {
        return destinationDefaultStr;
    }
    if ([sourceStr isKindOfClass:[NSString class]]) {
        if (sourceStr.length == 0) {
            if (destinationDefaultStr) {
                return destinationDefaultStr;
            }
        } else {
            return sourceStr;
        }
    }
    return @"";
}

+ (NSString *)qi_safeFormat:(NSString *)format {
    
    if (![format isKindOfClass:[NSString class]]) {
        return @"";
    }
    if (format) {
        return format;
    }
    return @"";
}

@end


@implementation NSArray (QiAvoidCommonCrash)

- (id)qi_safeObjectAtIndex:(NSUInteger)index {
    
    if (index < 0) {
        return nil;
    }
    
    if (index >= self.count) {
        return nil;
    }
    
    return [self objectAtIndex:index];
}

@end


@implementation NSMutableArray (QiAvoidCommonCrash)

- (void)qi_safeAddObject:(id)obj {
    
    if (!obj) {
        return;
    }
    [self addObject:obj];
}

@end


@implementation NSDictionary (QiAvoidCommonCrash)

- (id)qi_safeValueForkey:(NSString *)key {
    
    if (![key isKindOfClass:[NSString class]]) {
        return nil;
    }
    return [self valueForKey:key];
}

@end

#endif
